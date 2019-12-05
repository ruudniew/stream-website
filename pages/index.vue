<template>
  <div class="ruudniew-container">
    <div class="container">
      <div class="logo-container flex w-full justify-center mt-6">
        <img src="/ruudniew.png" class="p-2 w-48 h-56">
      </div>
      <div class="title-container text-center text-xl flex flex-wrap mt-6 justify-center">
        <div class="text-xl w-full text-gray-700 px-8" style="max-width: 768px">
          Welcome, random visitor! My name is Ruud, and I occasionally go live to share my love for tech. You can watch me live, right here. Below you'll find an explanation of <a style="color:#62a7db" class="underline" href="#explanation">how the stream works</a>, as well as the <a style="color:#62a7db" class="underline" href="#archive">past broadcasts</a>. Enjoy!
        </div>
      </div>
      <div class="twitch-embed-container px-8 mt-20 flex flex-wrap justify-center" >
        <div class="stream-title text-3xl font-bold text-center text-gray-800" style="max-width: 768px">
          Livestream
        </div>
        <!--
        <div class="stream-subtitle text-xl text-gray-700 mt-2 mb-6 w-full flex flex-wrap justify-center">
          <div style="max-width: 768px">
            <div><span class="font-bold">Current topic</span>: <a href="/t/gerrymandering" style="color:#62a7db" class="underline">gerrymandering</a> - can we make a program that creates fair voting-districts and make gerrymandering impossible? <a href="/t/gerrymandering" style="color:#62a7db" class="underline">Watch a short video</a> (2:30 minutes) explaining the topic, what it has to do with tech and why it's relevant for you.</div>
          </div>
        </div>
        -->
        <div class="stream-subtitle text-xl text-gray-700 mt-2 mb-6 w-full flex flex-wrap justify-center">
          <div style="max-width: 768px">
            <div><span class="font-bold">Current topic</span>: <a href="/t/soundboard" style="color:#62a7db" class="underline">interactive soundboard</a> - It's a struggle to find an interactive soundboard online. Let's create one ourselves! <a href="/t/soundboard" style="color:#62a7db" class="underline">Watch a short video</a> (2:30 minutes) explaining what we're doing</div>
          </div>
        </div>
        <iframe title="ruudniew's player frame" i18n-title="channel#ShareDialog:playerEmbedFrame|Embed player Frame copied from share dialog" allowfullscreen="true" src="https://mixer.com/embed/player/ruudniew" width="768" height="420"> </iframe>
      </div>
      <!--
      <div id="explanation" class="px-8 mt-24">
        <div class="archive-title text-3xl font-bold text-center text-gray-800">
          The stream explained
        </div>
        <div class="twitch-vods-subtitle text-xl flex justify-center flex-wrap text-gray-700 mt-2">
          <div class="text-center w-full" style="max-width: 768px">
              When live-streaming programming or other technical stuff, it's often difficult to follow along, especially for people that just joined the channel. To make the stream easier to understand, the topics will be divided into different stages
          </div>
          <div class="text-left w-full mt-4" style="max-width: 768px">
            <div class="mt-4"><span class="font-bold">1. Introduction (pre-recorded video)</span></div>
            <div class="">A short introduction video (around 2:30 minutes) of the topic that I'm going to stream about.</div>
            <div class="mt-4"><span class="font-bold">2. Research (live)</span></div>
            <div class="">The research stage is basically nothing more than tinkering around and preparing the next stage: the grind</div>
            <div class="mt-4"><span class="font-bold">3. The grind (live)</span></div>
            <div class="">The grind stage is where the actual building of solutions happens. </div>
            <div class="mt-4"><span class="font-bold">4. The presentation (live)</span></div>
            <div class="">A quick recap where all other stages are summarized. Hopefully this will be the most fun to watch!</div>
          </div>
        </div>
      </div>
      -->
      <div id="archive" class="px-8 mt-24">
        <div class="archive-title text-3xl font-bold text-center text-gray-800">
          Topic archive
        </div>
        <div class="twitch-vods-subtitle text-xl text-italic text-center text-gray-700 mt-2">
          The vods and videos around topics ranging from chatbots to gerrymandering
        </div>
        <div class="twitch-vods-self mb-12 mt-6 flex flex-wrap">
          <div class="twitch-vod-video self-start w-full lg:w-1/3 px-4 mb-4 lg:mb-0 " v-for="topic in reversedTopics">
            <div class="border border-gray-300 bg-white text-gray-700 shadow-lg rounded-lg mt-6">
              <div class="video-title text-base font-bold py-4 px-5">
                {{ topic.title }}
              </div>
              <div class="video-container relative">
                <video width="480" height="360" controls :class="'w-full ' + (topic.video === '' ? 'invisible' : '')">
                  <source :src="topic.video" type="video/mp4" class="z-40 relative">
                  Your browser does not support the video tag.
                </video>
                <div class="absolute top-0 left-0 w-full h-full flex justify-center items-center z-10 px-12 py-4 text-center italic" v-if="topic.video === ''"><div>This topic is still ongoing. Presentation video will appear here when available. Watch the <a :href="topic.readMore" class="underline font-bold" style="color:#62a7db">introduction video here</a></div></div>
              </div>

              <div class="flex flex-wrap">
                <div class="video-date text-base px-5 pt-4 w-full">
                  <span class="font-bold">Date:</span> {{ topic.dateStart }} <span v-if="topic.dateEnd !== ''">-</span> {{ topic.dateEnd}}
                </div>
                <div class="text-base px-5 pt-1 w-full" v-if="topic.stage !== ''">
                  <span class="font-bold">Stage:</span> {{ topic.stage }} <!-- <a class="cursor-pointer underline" style="color:#62a7db" href="#explanation">Learn more</a> about topic stages -->
                </div>
              </div>
              <div class="video-description text-base px-5 pt-4 text-justify" v-html="topic.question"></div>
              <a :href="topic.readMore" style="background-color:#62a7db" class="mt-4 mb-2 mx-5 px-3 py-2 inline-block rounded shadow text-white font-bold text-sm hover:shadow-lg">
                Go deeper (read more)
              </a>
              <div class="video-tags flex flex-wrap pt-2 pb-4 px-5">
                <div class="video-tag px-2 py-1 rounded text-sm mr-1 my-1" v-for="tag in topic.tags" style="background: #c5f7ff">
                  {{ tag }}
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
      <div class="twitch-vods-container px-8 mt-24">
        <div class="twitch-vods-title text-3xl font-bold text-center text-gray-800">
          First broadcasts
        </div>
        <div class="twitch-vods-subtitle text-xl text-italic text-center text-gray-700 mt-2">
          The untamed and uncut vods of the very first broadcasts. Only a mad(wo)man would watch these
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
              <video width="480" height="360" controls class="w-full" preload="metadata">
                <source :src="vod.src" type="video/mp4" >
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
      },

      reversedTopics () {
        return this.topics.reverse()
      }
    },

    mounted () {
      // this.$nextTick(() => {
      //   new Twitch.Embed("twitch-embed", {
      //     width: 1366,
      //     height: 500,
      //     channel: "ruudniew"
      //   });
      // })
    },


    data () {
      return {
        topics: [
          {
            title: 'Gerrymandering',
            video: '',
            readMore: '/t/gerrymandering',
            dateStart: '2019/12/11',
            dateEnd: '',
            question: 'Can we programmatically divide the population of a state in proportional districts?',
            stage: 'Planned'
          },
          {
            title: 'Interactive Soundboard',
            video: '/soundboard.mp4',
            readMore: '/t/soundboard',
            dateStart: '2019/12/05',
            dateEnd: '',
            question: 'Can we build an interactive soundboard that can be controlled by Mixer and Twitch users?',
            stage: 'Live'
          },
        ],

        vods: [
          {
            title: '[First Stream | Streamception | Dev. chatbot] Build the stream with me, live on stream',
            date: '2019/11/06',
            dateNice: 'November 6th, 2019',
            duration: '1:39h',
            src: 'https://ruudniew.com/vod-1.mp4',
            description: 'The first stream! Building a Twitch chatbot from scratch. Figuring out how Twitch works.',
            tags: ['First stream', 'Streamception', 'Dev', 'Chatbot']
          },
          {
            title: '[Second Stream | Streamception | Dev. chatbot & overlay] Build the stream with me, from scratch',
            date: '2019/11/08',
            dateNice: 'November 8th, 2019',
            duration: '2:43h',
            src: 'https://ruudniew.com/vod-2.mp4',
            description: 'Expanding the Twitch chatbot and building a stream overlay from scratch.',
            tags: ['Second Stream', 'Streamception', 'Dev', 'Chatbot', 'Overlay']
          },
          {
            title: '[3rd Streamception | !wtf | Dev. Chatbot, Overlay and website] Build the stream with me',
            date: '2019/11/11',
            dateNice: 'November 11th, 2019',
            duration: '2:42h',
            src: 'https://ruudniew.com/vod-3.mp4',
            description: 'Finishing up the chatbot and the stream overlay. Finding music and gifs for events. Start of the ruudniew.com website.',
            tags: ['Third Stream', 'Streamception', '!wtf','Dev', 'Chatbot', 'Overlay', 'Website']
          },
          {
            title: '[1984 in 2019] Do we live in an Orwellian society?',
            date: '2019/11/22',
            dateNice: 'November 12th, 2019',
            duration: '1:58h',
            src: 'https://ruudniew.com/vod-4.mp4',
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
