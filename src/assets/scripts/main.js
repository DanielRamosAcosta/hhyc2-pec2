/**
 * Import dependencies from node_modules
 * see commented examples below
 */

import 'bootstrap';

import '@fortawesome/fontawesome-free/css/fontawesome.css';
import '@fortawesome/fontawesome-free/css/brands.css';
import '@fortawesome/fontawesome-free/css/solid.css';

import '@fontsource/playfair-display/400.css';
import '@fontsource/playfair-display/700.css';
import '@fontsource/lato/400.css';
import '@fontsource/lato/700.css';
import '@fontsource/lato/900.css';

/**
 * Write any other JavaScript below
 */

+( function() {
  const university = "UOC";
  console.log(`Hello, ${university}!`);
} )();

document.addEventListener('DOMContentLoaded', function() {
  const imageModal = document.getElementById('imageModal');
  if (imageModal) {
    imageModal.addEventListener('show.bs.modal', function (event) {
      const button = event.relatedTarget;
      const imageSrc = button.getAttribute('data-image-src');
      const imageCaption = button.getAttribute('data-image-caption');

      const modalImage = imageModal.querySelector('#modalImage');
      const modalTitle = imageModal.querySelector('.modal-title');

      if (modalImage && imageSrc) {
        modalImage.src = imageSrc;
        modalImage.alt = imageCaption || '';
      }

      if (modalTitle && imageCaption) {
        modalTitle.textContent = imageCaption;
      }
    });
  }

  const forms = document.querySelectorAll('.needs-validation');
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  });
});
