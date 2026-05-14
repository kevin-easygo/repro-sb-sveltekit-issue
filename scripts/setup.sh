#!/bin/bash
set -e

pids=()

cleanup() {
  kill "${pids[@]}" 2>/dev/null
}

trap cleanup INT TERM EXIT

# Build Storybooks

(cd apps/vite7 && pnpm i && pnpm build-storybook) &
(cd apps/vite8 && pnpm i && pnpm build-storybook) &
wait

# Build apps
(cd apps/vite7 && pnpm build) &
(cd apps/vite8 && pnpm build) &
wait

# Serve

(cd apps/vite7 && npx http-server -p 6006 -c-1 ./storybook-static) &
pids+=($!)
(cd apps/vite8 && npx http-server -p 6007 -c-1 ./storybook-static) &
pids+=($!)
(cd apps/vite7 && pnpm vite preview) &
pids+=($!)
(cd apps/vite8 && pnpm vite preview) &
pids+=($!)

# Host compare page

(cd apps/compare && npx http-server -p 6010 -c-1 . -o) &
pids+=($!)

wait