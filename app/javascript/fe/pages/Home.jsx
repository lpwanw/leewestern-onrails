import React, {lazy, useState} from "react"
import {cn} from "@utils"
import {Link} from "react-router-dom"
import {motion, useMotionValue} from "framer-motion"

const Boxes = lazy(() => import("@ui/background-boxes"))

export default function() {
  const xPin = useMotionValue(0)
  const yPin = useMotionValue(0)
  const showPin = useMotionValue(0)
  const [pinTitle, setPinTitle] = useState("")

  const handleMouseMove = (e) => {
    xPin.set(e.clientX)
    yPin.set(e.clientY)
  }

  return (
    <div
      onMouseMove={handleMouseMove}
      className="h-full relative w-full overflow-hidden bg-gray-50 dark:bg-neutral-900 flex flex-col items-center justify-center">
      <div
        className="absolute inset-0 w-full h-full z-20 bg-inherit [mask-image:radial-gradient(transparent,white)] pointer-events-none"/>

      <Boxes>
        <Link to={"/"}
          className={cn(
            "w-full",
            "select-none absolute z-30 col-start-[20] col-span-5 row-start-[20] row-span-10"
          )}>
          <div
            className={cn(
              "select-none w-full cursor-pointer overflow-hidden shadow-2xl relative card h-96 rounded-md  mx-auto flex flex-col justify-end border border-transparent dark:border-neutral-800",
            )}
          >
            <div
              onMouseEnter={() => {showPin.set(1); setPinTitle("/home/me")}}
              onMouseLeave={() => showPin.set(0)}
              className={cn(
                "select-none w-full h-full bg-amber-500 shadow-2xl",
                "transition-all duration-500",
                "grayscale hover:grayscale-0",
              )}>

            </div>
          </div>
        </Link>
      </Boxes>

      <motion.div style={{y: yPin, x: xPin, opacity: showPin, translateY: "-100%" }}
        className={cn(
          "pointer-events-none absolute top-0 left-0",
        )}>
        <span className={"text-sm italic dark:text-gray-300"}>{pinTitle}</span>
        <div className="h-32 w-[1px] bg-black dark:bg-white">

        </div>
      </motion.div>

      <h1 className={cn("md:text-4xl text-xl text-neutral-700 dark:text-white  relative z-20")}>
      Tailwind is Awesome
      </h1>
      <p className="text-center mt-2 text-neutral-600 dark:text-neutral-300 relative z-20">
        Framer motion is the best animation library ngl
      </p>
    </div>
  )
}
