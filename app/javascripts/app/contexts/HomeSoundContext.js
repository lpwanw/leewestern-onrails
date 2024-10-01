import audioFile from "@assets/piano.mp3"
const audio = new Audio(audioFile)
const HomeSoundContext = {
  note: 0,
  audio,
  muted: true,
}

const noteTimeline = [
  [0, 4],
  [4, 8],
  [7, 10],
  [10, 14],
  [14, 18],
  [18, 22],
]
let soundTimeout = null

export const toggleMuted = (isMuted) => {
  HomeSoundContext.muted = isMuted
}

export const playSound = async () => {
  if (HomeSoundContext.muted) return
  const timeline = noteTimeline[HomeSoundContext.note]
  if (timeline) {
    const [start, end] = timeline
    if (soundTimeout) clearTimeout(soundTimeout)
    HomeSoundContext.audio.pause()
    HomeSoundContext.audio.currentTime = start
    HomeSoundContext.note = (HomeSoundContext.note + 1) % noteTimeline.length
    HomeSoundContext.audio.play()

    const duration = (end - start) * 1000 // Convert seconds to milliseconds
    soundTimeout = setTimeout(() => {
      HomeSoundContext.audio.pause()
    }, duration)
  }
}

export default HomeSoundContext
