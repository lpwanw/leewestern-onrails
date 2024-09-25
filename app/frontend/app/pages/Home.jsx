import React, { startTransition } from "react"
import { cn } from "@utils"
import { motion, useMotionValue } from "framer-motion"
import GrayCard from "@ui/GrayCard"
import LoopVideo from "@ui/LoopVideo"
import {
  IconSquareLetterT,
  IconSquareLetterA,
  IconSquareLetterY,
  IconSquareLetterN,
  IconSquareLetterE,
} from "@tabler/icons-react"
import Boxes from "@ui/background-boxes"

export default function () {
  const xPin = useMotionValue(0)
  const yPin = useMotionValue(0)
  const showPin = useMotionValue(0)
  const pinTitle = useMotionValue("")

  const handleMouseMove = (e) => {
    startTransition(() => {
      xPin.set(e.clientX)
      yPin.set(e.clientY)
    })
  }

  return (
    <div
      onMouseMove={handleMouseMove}
      className="text-sm md:text-base h-screen relative w-full overflow-hidden bg-gray-50 dark:bg-neutral-900 flex flex-col items-center justify-center"
    >
      <div className="absolute inset-0 w-full h-full z-20 bg-inherit [mask-image:radial-gradient(transparent,white)] pointer-events-none" />
      <Boxes>
        <GrayCard
          href={"/craft"}
          onMouseEnter={() => {
            showPin.set(1)
            pinTitle.set("/craft")
          }}
          onMouseLeave={() => {
            showPin.set(0)
          }}
          className={
            "absolute z-30 col-start-[21] md:col-start-[18] col-span-2 row-start-[22] md:row-start-[20]"
          }
        >
          <LoopVideo
            className={"h-full"}
            url={"https://cdn.rauno.me/flume-s2.mp4#t=0.01"}
          />
        </GrayCard>
        <GrayCard
          href={"/craft"}
          onMouseEnter={() => {
            showPin.set(1)
            pinTitle.set("/craft")
          }}
          onMouseLeave={() => {
            showPin.set(0)
          }}
          className={
            "absolute z-30 col-start-[25] md:col-start-[27] col-span-2 row-start-[22] md:row-start-[21]"
          }
        >
          <LoopVideo url={"https://cdn.rauno.me/gooey-s.mp4#t=0.01"} />
        </GrayCard>
        <GrayCard
          href={"/career"}
          onMouseEnter={() => {
            showPin.set(1)
            pinTitle.set("/career")
          }}
          onMouseLeave={() => {
            showPin.set(0)
          }}
          className={
            "absolute z-30 col-start-[26] md:col-start-[27] col-span-2 row-start-[28] md:row-start-[29]"
          }
        >
          <LoopVideo url={"https://cdn.rauno.me/gooey-s.mp4#t=0.01"} />
        </GrayCard>

        <IconSquareLetterT className="dark:text-gray-200 h-full w-full absolute z-30 col-start-[23] md:col-start-[20] row-start-[25] col-span-1 row-span-1  md:col-span-2 md:row-span-2 pointer-events-none" />
        <IconSquareLetterA className="dark:text-gray-200 h-full w-full absolute z-30 col-start-[24] md:col-start-[22] row-start-[26] col-span-1 row-span-1  md:row-start-[26] md:col-span-2 md:row-span-2 pointer-events-none" />
        <IconSquareLetterY className="dark:text-gray-200 h-full w-full absolute z-30 col-start-[25] md:col-start-[24] row-start-[25] col-span-1 row-span-1 md:col-span-2 md:row-span-2 pointer-events-none" />
        <IconSquareLetterN className="dark:text-gray-200 h-full w-full absolute z-30 col-start-[26] md:col-start-[26] row-start-[26] md:row-start-[26] col-span-1 row-span-1 md:col-span-2 md:row-span-2 pointer-events-none" />
        <IconSquareLetterE className="dark:text-gray-200 h-full w-full absolute z-30 col-start-[27] md:col-start-[28] row-start-[25] col-span-1 row-span-1 md:col-span-2 md:row-span-2 pointer-events-none" />
      </Boxes>

      <motion.div
        style={{ y: yPin, x: xPin, opacity: showPin, translateY: "-100%" }}
        className={cn(
          "pointer-events-none absolute top-0 left-0 mix-blend-difference",
        )}
      >
        <motion.div className={"text-sm italic text-white"}>
          {pinTitle}
        </motion.div>
        <div className="h-32 w-[1px] bg-white"></div>
      </motion.div>
    </div>
  )
}
