# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Este bloque anula el comportamiento por defecto de Rails de envolver
# los campos con errores en un <div class="field_with_errors">.
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  # Devolvemos el tag HTML original marcado como seguro para el navegador.
  html_tag.html_safe
end
