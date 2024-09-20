import React, {lazy} from "react";
import {cn} from "@utils";

const Boxes = lazy(() => import("@ui/background-boxes"))

export default function() {
  return (
    <div
      className="h-full relative w-full overflow-hidden bg-gray-50 dark:bg-neutral-900 flex flex-col items-center justify-center">
      <div
        className="absolute inset-0 w-full h-full z-20 bg-inherit [mask-image:radial-gradient(transparent,white)] pointer-events-none"/>

      <Boxes/>
      <h1 className={cn("md:text-4xl text-xl text-neutral-700 dark:text-white  relative z-20")}>
        Tailwind is Awesome
      </h1>
      <p className="text-center mt-2 text-neutral-600 dark:text-neutral-300 relative z-20">
        Framer motion is the best animation library ngl
      </p>
    </div>
  )
}
