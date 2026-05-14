<script module lang="ts">
  import { defineMeta } from "@storybook/addon-svelte-csf";
  import Tag from "$lib/components/Tag.svelte";
  const { Story } = defineMeta({ title: "Other", component: Tag });
</script>

<Story name="x"><Tag /></Story>
