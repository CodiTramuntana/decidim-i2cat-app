// This file is compiled inside Decidim core pack. Code can be added here and will be executed
// as part of that pack

// Load images
require.context("../../images", true)

/**
 * This removes the attribute `target` from each anchor tag
 * when the URL redirects to an internal page.
 */
document.addEventListener("DOMContentLoaded", function() {
  document.querySelectorAll('a').forEach((element) => {
    if (element.href.includes('participa.challenge.cat')) {
      element.removeAttribute('target');
    }
  });
});

