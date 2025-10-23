#!/usr/bin/env bash
#
# Expected setup:
#   - The axlearn github repository is expected to have a series of checks enabled as documented on https://quip-apple.com/yOfDApJFPE3w
#
# Expected environment variables:
#   - BUILD_PARAM_MERGE_QUEUE_BRANCH: This one is defined as part of the Rio pipeline as build parameter MERGE_QUEUE_BRANCH
#
set -x

# If not in a merge queue build, exit.
if [ -z "$BUILD_PARAM_MERGE_QUEUE_BRANCH" ]; then
    exit 0
fi

echo "In a merge queue build."

max_retries=5
delay=10
fetched=false
for attempt in $(seq 1 $max_retries); do
    echo "Attempting to fetch merge-queue branch, $attempt/$max_retries..."

    if SSH_AUTH_SOCK=$SSH_AUTH_SOCK_GITHUB_KEY git fetch -q origin "refs/heads/$BUILD_PARAM_MERGE_QUEUE_BRANCH"; then
        fetched=true
        break
    else
        if [ "$attempt" -lt "$max_retries" ]; then
            echo "Retrying in $delay seconds..."
            sleep $delay
        fi
    fi
done

if [[ "$fetched" == false ]]; then
    echo "Failed to fetch merge-queue branch!"
    exit 1
fi

# Update local code.
SSH_AUTH_SOCK=$SSH_AUTH_SOCK_GITHUB_KEY git fetch -q origin "refs/heads/$BUILD_PARAM_MERGE_QUEUE_BRANCH"
git checkout -q $BUILD_PARAM_MERGE_QUEUE_BRANCH

# Mimic a PRB run so `submit_and_monitor_bolt_task.py` and `maybe_skip_pipeline.py` work correctly.
export GIT_COMMIT=`git rev-parse HEAD`
export GIT_COMMIT_SHORT="${GIT_COMMIT:0:12}"

# Extract PR id to tag Bolt tasks.
[[ $BUILD_PARAM_MERGE_QUEUE_BRANCH =~ /pr-([0-9]+)- ]]
export GIT_PR_ID=${BASH_REMATCH[1]}
export GIT_PR_URL="https://github.pie.apple.com/foundation-models/axlearn/pull/${GIT_PR_ID}"
