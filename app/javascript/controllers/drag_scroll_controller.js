import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="drag-scroll"
export default class extends Controller {
  connect() {
    this.isDown = false;
    this.startX = null;
    this.scrollLeft = null;
    this.element.addEventListener('mousedown', (e) => {
      this.isDown = true;
      this.element.classList.add('cursor-grabbing');
      this.startX = e.pageX - this.element.offsetLeft;
      this.scrollLeft = this.element.scrollLeft;
    })

    this.element.addEventListener('mouseleave', () => {
      this.isDown = false;
      this.element.classList.remove('cursor-grabbing');
    });

    this.element.addEventListener('mouseup', () => {
      this.isDown = false;
      this.element.classList.remove('cursor-grabbing');
    });

    this.element.addEventListener('mousemove', (e) => {
      if (!this.isDown) return;

      e.preventDefault();
      const x = e.pageX - this.element.offsetLeft;
      const walk = (x - this.startX);
      this.element.scrollLeft = this.scrollLeft - walk;
    });
  }
}
