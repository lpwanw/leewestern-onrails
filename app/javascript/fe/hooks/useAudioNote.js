import { useState, useRef, useEffect, useCallback } from "react"
import soundFile from "@assets/piano.mp3"

const noteTimeline = [
  [0, 4],
  [4, 7],
  [7, 10],
  [10, 14],
  [14, 17],
  [18, 21],
]

export const useNotePlayer = () => {
  const [noteIndex, setNoteIndex] = useState(0)
  const audioRef = useRef(new Audio(soundFile))
  const timeoutRef = useRef()

  useEffect(() => {
    // Cleanup function to stop audio and clear timeout when component unmounts or updates
    return () => {
      audioRef.current.pause()
      clearTimeout(timeoutRef.current)
    }
  }, [])

  const playCurrentNote = useCallback(() => {
    const timeline = noteTimeline[noteIndex]
    if (timeline) {
      const [start, end] = timeline
      audioRef.current.pause()
      audioRef.current.currentTime = start
      audioRef.current.play()

      const duration = (end - start) * 1000 // Convert seconds to milliseconds
      timeoutRef.current = setTimeout(() => {
        audioRef.current.pause()
        // Automatically move to the next note
        setNoteIndex((prevIndex) => (prevIndex + 1) % noteTimeline.length)
      }, duration)
    }
  }, [noteIndex])

  useEffect(() => {
    playCurrentNote()
  }, [playCurrentNote])

  const playNote = useCallback(() => {
    // Manually trigger playing the next note
    setNoteIndex((prevIndex) => (prevIndex + 1) % noteTimeline.length)
  }, [])

  return playNote
}
