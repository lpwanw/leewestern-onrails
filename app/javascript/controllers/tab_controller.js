import { Controller } from "@hotwired/stimulus"
import { animate } from "motion"

// Connects to data-controller="tab"
export default class extends Controller {
  static targets = ["indicator", "link"]

  connect() {
    this.setActiveTab(this.linkTargets[0])
  }

  select(event) {
    this.setActiveTab(event.currentTarget)
  }

  setActiveTab(clickedTab) {
    this.linkTargets.forEach(tab => {
      if (tab === clickedTab) {
        tab.classList.remove('text-gray-400')
        tab.classList.add('text-black')
      } else {
        tab.classList.remove('text-black')
        tab.classList.add('text-gray-400')
      }
    })

    const tabWidth = clickedTab.offsetWidth
    const tabLeft = clickedTab.offsetLeft

    animate(this.indicatorTarget, {
      left: `${tabLeft}px`,
      width: `${tabWidth}px`
    }, { 
      duration: 0.3, 
      easing: [.25, .1, .25, 1] 
    })
  }
}
