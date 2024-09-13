import { Controller } from "@hotwired/stimulus";
import moment from 'moment';


// Connects to data-controller="timeago"
export default class extends Controller {
  static values = {
    time: String,
  }

  connect() {
    this.setTime();
    setInterval(() => {
      this.setTime();
    }, 10000);
  }

  setTime() {
    this.element.textContent = moment(this.timeValue).fromNow();
  }
}
