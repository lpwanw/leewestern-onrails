import React, { useEffect, useState } from "react"
import { Outlet, useLocation } from "react-router-dom"
import {
  IconHome,
  IconBrandGithub,
  IconBrandLinkedin,
  IconMail,
  IconBrandThreads,
  IconCategoryPlus,
  IconRoad,
} from "@tabler/icons-react"
import { FloatingDock } from "@ui/floating-dock"
import { cn } from "@utils"
import ThemeToggle from "@components/theme/ThemeToggle"

export default function () {
  let location = useLocation()
  const [theme, setTheme] = useState(
    localStorage.getItem("color-theme") ||
      (window.matchMedia("(prefers-color-scheme: dark)").matches
        ? "dark"
        : "light"),
  )

  useEffect(() => {
    if (theme === "dark") {
      document.documentElement.classList.add("dark")
      localStorage.setItem("color-theme", "dark")
    } else {
      document.documentElement.classList.remove("dark")
      localStorage.setItem("color-theme", "light")
    }
  }, [theme])

  const toggleTheme = () => {
    if (location.pathname === "/") return
    setTheme(theme === "light" ? "dark" : "light")
  }

  const navigationItems = [
    {
      title: "Home",
      icon: (
        <IconHome className="h-full w-full text-neutral-500 dark:text-neutral-300" />
      ),
      href: "/",
    },
    {
      title: "Craft",
      icon: (
        <IconCategoryPlus className="h-full w-full text-neutral-500 dark:text-neutral-300" />
      ),
      href: "/craft",
    },
    {
      title: "My Career",
      icon: (
        <IconRoad className="h-full w-full text-neutral-500 dark:text-neutral-300" />
      ),
      href: "/career",
    },
    {
      title: "My Writing",
      icon: (
        <IconBrandThreads className="h-full w-full text-neutral-500 dark:text-neutral-300" />
      ),
      href: "#",
      onClick: () => {
        window.location.href = "/posts"
      },
    },
    {
      title: "slast1",
    },
    {
      title: "Linkedin",
      icon: (
        <IconBrandLinkedin className="h-full w-full text-neutral-500 dark:text-neutral-300" />
      ),
      href: "https://www.linkedin.com/in/lpwanw",
    },
    {
      title: "Github",
      icon: (
        <IconBrandGithub className="h-full w-full text-neutral-500 dark:text-neutral-300" />
      ),
      href: "https://github.com/lpwanw",
    },
    {
      title: "Mail",
      icon: (
        <IconMail className="h-full w-full text-neutral-500 dark:text-neutral-300" />
      ),
      href: "mailto:phuongtay2000@gmail.comm",
    },
    {
      title: "slast2",
    },
    {
      title: "Toggle Theme",
      icon: <ThemeToggle theme={theme} />,
      onClick: toggleTheme,
      href: "#",
    },
  ]

  return (
    <div className="flex min-h-screen flex-col bg-gray-50 dark:bg-neutral-950 dark:text-gray-200">
      <FloatingDock
        desktopClassName={cn("fixed bottom-10 z-30 left-1/2 -translate-x-1/2")}
        mobileClassName={cn("fixed bottom-10 z-30 left-1/2 -translate-x-1/2")}
        items={navigationItems}
      />
      <Outlet />
    </div>
  )
}
