<template>
  <div class="ruudniew-container">
    <div class="container">
      <a class="logo-container flex w-full justify-center mt-6" href="/">
        <img src="/ruudniew.png" class="p-2 w-48 h-56">
      </a>
      <div class="title-container text-center text-xl flex flex-wrap mt-6 justify-center">
        <div class="text-xl w-full text-gray-700 px-8" style="max-width: 768px">
          <a href="/" style="color:#62a7db" class="underline">Click here</a> to go back to the homepage.
        </div>
      </div>

      <div class="subject-container px-8 mt-8 flex flex-wrap justify-center" v-if="subject !== null">
        <div class="subject-title text-3xl font-bold text-center text-gray-800" style="max-width: 768px">
          {{ subject.title }}
        </div>
        <div class="subject-short-explanation text-xl text-gray-700 mt-4 w-full flex flex-wrap justify-center">
          <div style="max-width: 768px">
            <div class="mb-4" v-for="qa in subject.faq"><span class="font-bold">{{ qa.q }}</span> {{ qa.a }}</div>
          </div>
        </div>
        <div class="subject-title text-3xl mt-12 font-bold text-center text-gray-800" style="max-width: 768px">
          Introduction (0:56 min)
        </div>
        <div class="w-full flex justify-center mt-2">
          <div class="video-container relative" style="max-width: 768px;">
            <video width="768" height="520" controls class="w-full rounded shadow-lg">
              <source src="https://ruudniew.com/soundboard.mp4" type="video/mp4" class="z-40 relative">
              Your browser does not support the video tag.
            </video>
          </div>
        </div>

        <div v-for="stage in subject.stages" class="">
          <div class="subject-title text-3xl font-bold text-center text-gray-800 mt-12" style="max-width: 768px">
            {{ stage.title }} summary
          </div>
          <div class="w-full flex justify-center mt-2">
            <div class="text-xl text-gray-700 mt-2 w-full flex flex-wrap justify-center" style="max-width: 768px;">
              <div v-text="stage.description"></div>
            </div>
          </div>
          <div class="w-full flex justify-center mt-2" v-if="stage.video !== ''">
            <div class="video-container relative" style="max-width: 768px;">
              <video width="768" height="520" controls class="w-full rounded shadow-lg">
                <source :src="stage.video" type="video/mp4" class="z-40 relative">
                Your browser does not support the video tag.
              </video>
            </div>
          </div>
        </div>
        <div class="h-20">&nbsp;</div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    mounted () {
      if (this.$route.params['topic'] !== undefined && this.$route.params['topic'] !== '') {
        let subject = this.subjects.filter(subj => subj.urlkey === this.$route.params['topic'])
        if (subject.length > 0) {
          this.subject = subject[0]
        }
      }
    },

    data () {
      return {
        subject: null,
        subjects: [
          {
            urlkey: 'gerrymandering',
            title: 'Gerrymandering',
            video: '',
            faq: [
              {
                'q': 'What is Gerrymandering?',
                'a': 'Gerrymandering is when politicians try to unfairly divide their population into districts, so that their party has a better chance of winning an election. By smartly (and unfairly!) doing this, they could even turn a win for an opposing party, into a win for their own party.'
              },
              {
                'q': 'What does it have to do with tech?',
                'a': 'Since humans create very unfair voting districts, an objective program could probably do a better job of dividing districts'
              },
              {
                'q': 'What is your goal?',
                'a': 'To create a program that fairly divides a state into districts'
              }
            ],
            stages: [
              {
                'title': 'Research',
                'description': 'At this moment, the research into gerrymandering and the preparation for the stream haven\'t finished yet. Watch the (next) livestream or come back later for a summary',
                'video': ''
              },
              {
                'title': 'Grind',
                'description': 'At this moment, the grind hasn\'t finished yet. Watch the (next) livestream or come back later for a summary',
                'video': ''
              },
              {
                'title': 'Presentation',
                'description': 'At this moment, the presentation hasn\'t finished yet. Watch the (next) livestream or come back later for a summary',
                'video': ''
              }
            ]
          },
          {
            urlkey: 'soundboard',
            title: 'Interactive Soundboard',
            faq: [
              {
                'q': 'Why?',
                'a': "It's a struggle to find an interactive soundboard online. Let's create one ourselves!"
              },
              {
                'q': 'Interactive?',
                'a': 'Yes, interactive. The soundboard should be controllable by viewers through the chat (Twitch and Mixer), but also through Mixer\'s interactive controls'
              }
            ],
            video: '',
            stages: [
              {
                'title': 'Soundboard',
                'description': 'At this moment, the creation of the soundboard hasn\'t finished yet. Watch the (next) livestream or come back later for a summary',
                'video': ''
              }
            ]
          }
        ]
      }
    }
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
</style>
