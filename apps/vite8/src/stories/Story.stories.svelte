<script module lang="ts">
  import { defineMeta } from "@storybook/addon-svelte-csf";
  import Box from "$lib/components/Box.svelte";
  import Tag from "$lib/components/Tag.svelte";

  const { Story } = defineMeta({ title: "Repro", component: Box });
</script>

<Story name="Bug" asChild>
  <Box>
    <div>spacer</div>
    <Tag />
  </Box>
</Story>
