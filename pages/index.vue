<template>
  <div class="ruudniew-container mb-12">
    <div class="container">
      <div class="logo-container flex w-full justify-center mt-12">
        <img src="/ruudniew.png" class="p-2 w-48">
      </div>
      <div class="twitch-embed-container px-12 mt-12">
        <div id="twitch-embed" class="w-full"></div>
        <script src="https://embed.twitch.tv/embed/v1.js"></script>
      </div>
      <div class="twitch-vods-container px-8 mt-12">
        <div class="twitch-vods-title text-3xl font-bold text-center text-gray-800">
          Past broadcasts
        </div>

        <div class="twitch-vods-self mt-12">
          <div class="twitch-vod-video" v-for="vod in vods">
            <video width="320" height="240" controls class="border border-gray-300 shadow-lg rounded">
              <source :src="vod.src" type="video/mp4">
              Your browser does not support the video tag.
            </video>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'ruudniew-stream-website',

    data () {
      return {
        vods: [
          {
            title: 'First stream - 2019/11/06',
            src: '/vod-2.mp4'
          }
        ]
      }
    },


    mounted () {
      this.$nextTick(() => {
        new Twitch.Embed("twitch-embed", {
          width: 1366,
          height: 768,
          channel: "ruudniew"
        });
      })
    }
  }
</script>

<style>
  body {
    background-color: #f7fffc
  }

  .ruudniew-container {
    @apply flex justify-center
  }
  #twitch-embed iframe{
    @apply w-full border border-gray-300 shadow-lg rounded
  }
</style>
