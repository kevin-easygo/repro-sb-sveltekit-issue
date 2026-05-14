<script lang="ts">
  let { children } = $props();
</script>

<div class="box">
  {@render children?.()}
</div>

<style>
  .box {
    padding: 16px;
    border: 2px dashed #888;
    background: #f4f4f8;
    font-family: system-ui, sans-serif;
  }

  .box > :global(* + *) {
    margin-top: 80px;
    outline: 3px solid red;
    outline-offset: 4px;
  }
</style>
