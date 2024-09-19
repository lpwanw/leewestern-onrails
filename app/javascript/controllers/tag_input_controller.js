import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tag-input"
export default class extends Controller {
  static targets = ["input", "field", "container", "tags"]

  connect() {
    this.regex = /^[a-zA-Z0-9_]+$/;
    this.tags = []
    this.addTag(this.fieldTarget.value)
    this.inputTarget.addEventListener("change", (e) => {
      this.addTag(e.target.value);
      this.inputTarget.value = "";
    })
    this.inputTarget.addEventListener("keydown", (e) => {
      if (!this.regex.test(e.key) || event.key === "Enter") {
        e.preventDefault();
        if(this.inputTarget.value.trim() !== "") {
          this.addTag(e.target.value)
          this.inputTarget.value = "";
        }
      }
    })
  }

  addTag(string) {
    const tag_values = string.split(" ").filter(value => value.trim() !== "");
    this.tags = [...new Set([...this.tags, ...tag_values])].filter(tag => this.regex.test(tag))

    this.fieldTarget.value = this.tags

    this.renderTag()
  }

  renderTag() {
    this.removeOldItem()
    this.tags.forEach(tag => {
      if ($(`#tag_${tag}`).length !== 0) {
        return
      }

      $(this.containerTarget).append(this.tagElement(tag))
    })
  }

  removeOldItem() {
    $(this.containerTarget).children().each((_, item) => {
      if (!this.tags.includes(item.textContent)) {
        item.remove();
      }
    })
  }

  removeTag({params: { tag }}) {
    $(`#tag_${tag}`).remove();
    this.tags = this.tags.filter(item => item !== `${tag}`);
    this.fieldTarget.value = this.tags
  }

  tagElement(tag) {
    return (`
      <li data-tag-input-target="tag"
          id="tag_${tag}"
          class="transition-all border border-white dark:border-black px-1 hover:bg-blue-200 text-gray-800 inline-flex items-center rounded dark:bg-gray-700 dark:text-gray-400 hover:border hover:border-blue-300">
        <span class=" py-0.5">
          #${tag}
        </span>
        <svg xmlns="http://www.w3.org/2000/svg"
             fill="none"
             viewBox="0 0 24 24"
             stroke-width="1.5"
             stroke="currentColor"
             data-tag-input-tag-param="${tag}"
             data-action="click->tag-input#removeTag"
             class="size-3 cursor-pointer">
          <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
        </svg>
      </li>`)
  }
}
