"use client"
import React from "react"
import {cn} from "@utils"

export const BoxesCore = ({
  className,
  children,
  ...rest
}) => {
  const squares = new Array(50*50).fill(1)
  let colors = [
    "--sky-300",
    "--pink-300",
    "--green-300",
    "--yellow-300",
    "--red-300",
    "--purple-300",
    "--blue-300",
    "--indigo-300",
    "--violet-300",
  ]
  const getRandomColor = () => {
    return colors[Math.floor(Math.random() * colors.length)]
  }

  const style = {
    opacity: 1,
    transform: `
    translate(calc(-50% + var(--x)), calc(-50% + var(--y)))
    skewX(-48deg)
    skewY(14deg)
    scaleX(2)
    scale(0.298828125)
    rotate(var(--rotate))
    translateZ(0)
  `,
    "--rotate": "0deg",
    "--x": "0px",
    "--y": "0px",
  }

  return (
    <div
      style={style}
      className={cn(
        "fixed top-1/2 left-1/2 grid grid-cols-boxes grid-rows-boxes z-0 w-max",
        className
      )}
      {...rest}>
      {children}
      {
        squares.map((_, i) => (
          <div className="w-32 h-32 relative grid grid-cols-2 grid-rows-2" key={"square" + i}>
            {
              (new Array(4).fill(1)).map((_, j) => (
                <div
                  key={"cel_" + j}
                  className={cn("transition-all duration-[2000ms] hover:duration-0 ease-out border border-dotted border-slate-700",
                    `hover:bg-[color:var(${getRandomColor()})]`)}>

                </div>
              ))
            }
          </div>
        ))
      }
    </div>
  )
}

export default React.memo(BoxesCore)
