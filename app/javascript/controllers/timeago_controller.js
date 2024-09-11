import { Controller } from "@hotwired/stimulus";
import moment from 'moment';


// Connects to data-controller="timeago"
export default class extends Controller {
  static values = {
    time: String,
  }

  connect() {
    this.element.textContent = moment(this.timeValue).fromNow();
  }
}
