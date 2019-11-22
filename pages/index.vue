<template>
  <div class="ruudniew-container">
    <div class="container">
      <div class="logo-container flex w-full justify-center mt-6">
        <img src="/ruudniew.png" class="p-2 w-48 h-56">
      </div>
      <div class="title-container text-center text-xl flex flex-wrap mt-12 justify-center">
        <div class="text-3xl w-full font-bold text-gray-800">Welcome</div>
        <div class="text-xl w-full text-gray-700 px-8" style="max-width: 768px">
          Welcome, random visitor! My name is Ruud, and I occasionally go live on Twitch to talk about tech. You can watch me live, right here. Below you can also find the <span style="color:#62a7db">past broadcasts</span>. Enjoy!
        </div>
      </div>
      <div class="twitch-embed-container px-12 mt-6">
        <div id="twitch-embed" class="w-full flex">
        </div>
      </div>
      <div class="twitch-vods-container px-8 mt-24">
        <div class="twitch-vods-title text-3xl font-bold text-center text-gray-800">
          Past broadcasts
        </div>
        <div class="twitch-vods-subtitle text-xl text-italic text-center text-gray-700 mt-2">
          The untamed and uncut vods. Only a mad(wo)man would watch these
        </div>
        <div class="twitch-vods-subtitle-warning text-lg text-center" style="color:#62a7db">
          Warning: not even feeling cute, and still I might delete later 😉
        </div>
        <div class="twitch-vods-self mb-12 mt-6 flex flex-wrap">
          <div class="twitch-vod-video self-start w-full lg:w-1/3 px-4 mb-4 lg:mb-0 " v-for="vod in reversedVods">
            <div class="border border-gray-300 bg-white text-gray-700 shadow-lg rounded-lg mt-6">
              <div class="video-title text-base font-bold py-4 px-5">
                {{ vod.dateNice }}
              </div>
              <video width="480" height="360" controls class="w-full">
                <source :src="vod.src" type="video/mp4">
                Your browser does not support the video tag.
              </video>
              <div class="flex">
                <div class="video-date text-base px-5 pt-4 font-bold">
                  Date: {{ vod.date }}
                </div>
                <div class="video-duration text-base px-5 pt-4 font-bold">
                  Duration: {{ vod.duration }}
                </div>
              </div>
              <div class="video-description text-base px-5 pt-2 text-justify">
                {{ vod.description }}
              </div>
              <div class="video-tags flex flex-wrap pt-2 pb-4 px-5">
                <div class="video-tag px-2 py-1 rounded text-sm mr-1 my-1" v-for="tag in vod.tags" style="background: #c5f7ff">
                  {{ tag }}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'ruudniew-stream-website',

    computed: {
      reversedVods () {
        return this.vods.reverse()
      }
    },

    mounted () {
      this.$nextTick(() => {
        new Twitch.Embed("twitch-embed", {
          width: 1366,
          height: 500,
          channel: "ruudniew"
        });
      })
    },


    data () {
      return {
        vods: [
          {
            title: '[First Stream | Streamception | Dev. chatbot] Build the stream with me, live on stream',
            date: '2019/11/06',
            dateNice: 'November 6th, 2019',
            duration: '1:39h',
            src: '/vod-1.mp4',
            description: 'The first stream! Building a Twitch chatbot from scratch. Figuring out how Twitch works.',
            tags: ['First stream', 'Streamception', 'Dev', 'Chatbot']
          },
          {
            title: '[Second Stream | Streamception | Dev. chatbot & overlay] Build the stream with me, from scratch',
            date: '2019/11/08',
            dateNice: 'November 8th, 2019',
            duration: '2:43h',
            src: '/vod-2.mp4',
            description: 'Expanding the Twitch chatbot and building a stream overlay from scratch.',
            tags: ['Second Stream', 'Streamception', 'Dev', 'Chatbot', 'Overlay']
          },
          {
            title: '[3rd Streamception | !wtf | Dev. Chatbot, Overlay and website] Build the stream with me',
            date: '2019/11/11',
            dateNice: 'November 11th, 2019',
            duration: '2:42h',
            src: '/vod-3.mp4',
            description: 'Finishing up the chatbot and the stream overlay. Finding music and gifs for events. Start of the ruudniew.com website.',
            tags: ['Third Stream', 'Streamception', '!wtf','Dev', 'Chatbot', 'Overlay', 'Website']
          },
          {
            title: '[1984 in 2019] Do we live in an Orwellian society?',
            date: '2019/11/22',
            dateNice: 'November 12th, 2019',
            duration: '1:58h',
            src: '/vod-4.mp4',
            description: 'Summarizing the book 1984, looking into the dystopian predictions George Orwell made and matching them to our reality in 2019. Did Trump change his vocabulary to newspeak on purpose, or is he just mentally declining?',
            tags: ['Fourth stream', '1984', '2019', '!wtf', 'George Orwell', 'Big Brother', 'Donald Trump']
          }
        ]
      }
    },


  }
</script>

<style>
  body {
    background-color: rgba(197,247,255, 0.2)
  }

  .special-color {
    color: #c5f7ff
  }

  .ruudniew-container {
    @apply flex justify-center
  }
  #twitch-embed iframe{
    @apply w-full border border-gray-300 shadow-lg rounded
  }
</style>
