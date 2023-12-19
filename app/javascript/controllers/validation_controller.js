import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="validation"
export default class extends Controller {
  static targets = ["runValidation"];

  passwordInput() {
    clearTimeout(this.timeout);
    this.timeout = setTimeout(() => {
      this.runValidationTarget.click(this);
    }, 500);
  }
}
