<template>
  <div class="ruudniew-container">
    <div class="container">
      <a class="logo-container flex w-full justify-center mt-6" href="/">
        <img src="/ruudniew.png" class="p-2 w-48 h-56">
      </a>
      <div class="title-container text-center text-xl flex flex-wrap mt-6 justify-center">
        <div class="text-xl w-full text-gray-700 px-8" style="max-width: 768px">
          Welcome, random visitor! My name is Ruud, and I occasionally go live on Twitch to share my love for tech. <a href="/" style="color:#62a7db" class="underline">Click here</a> to go back to the homepage.
        </div>
      </div>

      <div class="subject-container px-8 mt-20 flex flex-wrap justify-center" v-if="subject !== null">
        <div class="subject-title text-3xl font-bold text-center text-gray-800" style="max-width: 768px">
          {{ subject.title }}
        </div>
        <div class="subject-short-explanation text-xl text-gray-700 mt-2 w-full flex flex-wrap justify-center">
          <div style="max-width: 768px">
            <div><span class="font-bold">What is {{ subject.title.toLowerCase() }}?</span> {{ subject.shortExplanation }}</div>
            <div class="mt-2"><span class="font-bold">What does it have to do with tech?</span> {{ subject.techRelation }}</div>
            <div class="mt-2"><span class="font-bold">What is your goal?</span> {{ subject.goal }}</div>

          </div>
        </div>
        <div class="subject-title text-3xl mt-12 font-bold text-center text-gray-800" style="max-width: 768px">
          Introduction (2:30 minutes)
        </div>
        <div class="w-full flex justify-center mt-2" v-if="subject.video !== ''">
          <div class="video-container relative" style="max-width: 768px;">
            <video width="768" height="520" controls class="w-full rounded shadow-lg">
              <source :src="subject.video" type="video/mp4" class="z-40 relative">
              Your browser does not support the video tag.
            </video>
          </div>
        </div>
        <div class="w-full flex justify-center mt-2" v-if="subject.video === ''">
          <div class="video-container relative" style="max-width: 768px;">
            <div class="text-gray-700 text-xl italic">Introduction video coming soon</div>
          </div>
        </div>
        <div class="subject-title text-3xl font-bold text-center text-gray-800 mt-12" style="max-width: 768px">
          Research summary
        </div>
        <div class="w-full flex justify-center mt-2">
          <div class="text-xl text-gray-700 mt-2 w-full flex flex-wrap justify-center" style="max-width: 768px;">
            <div v-text="subject.research"></div>
          </div>
        </div>
        <div class="w-full flex justify-center mt-2" v-if="subject.researchVideo !== ''">
          <div class="video-container relative" style="max-width: 768px;">
            <video width="768" height="520" controls class="w-full rounded shadow-lg">
              <source :src="subject.researchVideo" type="video/mp4" class="z-40 relative">
              Your browser does not support the video tag.
            </video>
          </div>
        </div>
        <div class="subject-title text-3xl font-bold text-center text-gray-800 mt-12" style="max-width: 768px">
          Grind summary
        </div>
        <div class="w-full flex justify-center mt-2">
          <div class="text-xl text-gray-700 mt-2 w-full flex flex-wrap justify-center" style="max-width: 768px;">
            <div v-text="subject.grind"></div>
          </div>
        </div>
        <div class="w-full flex justify-center mt-2" v-if="subject.grindVideo !== ''">
          <div class="video-container relative" style="max-width: 768px;">
            <video width="768" height="520" controls class="w-full rounded shadow-lg">
              <source :src="subject.grindVideo" type="video/mp4" class="z-40 relative">
              Your browser does not support the video tag.
            </video>
          </div>
        </div>
        <div class="subject-title text-3xl font-bold text-center text-gray-800 mt-12" style="max-width: 768px">
          Presentation
        </div>
        <div class="w-full flex justify-center mt-2">
          <div class="text-xl text-gray-700 mt-2 w-full flex flex-wrap justify-center" style="max-width: 768px;">
            <div v-text="subject.presentation"></div>
          </div>
        </div>
        <div class="w-full flex justify-center mt-2" v-if="subject.presentationVideo !== ''">
          <div class="video-container relative" style="max-width: 768px;">
            <video width="768" height="520" controls class="w-full rounded shadow-lg">
              <source :src="subject.presentationVideo" type="video/mp4" class="z-40 relative">
              Your browser does not support the video tag.
            </video>
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
            shortExplanation: 'Gerrymandering is when politicians try to unfairly divide their population into districts, so that their party has a better chance of winning an election. By smartly (and unfairly!) doing this, they could even turn a win for an opposing party, into a win for their own party.',
            video: '',
            techRelation: 'Since humans create very unfair voting districts, an objective program could probably do a better job of dividing districts',
            goal: 'To create a program that fairly divides a state into districts',
            research: 'At this moment, the research into gerrymandering and the preparation for the stream haven\'t finished yet. Watch the (next) livestream or come back later for a summary',
            researchVideo: '',
            grind: 'At this moment, the grind hasn\'t finished yet. Watch the (next) livestream or come back later for a summary',
            grindVideo: '',
            presentation: 'At this moment, the presentation hasn\'t finished yet. Watch the (next) livestream or come back later for a summary',
            presentationVideo: ''
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
