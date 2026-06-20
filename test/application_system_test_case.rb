require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # Configuración por defecto para correr los tests usando un navegador sin interfaz (headless)
  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]
end
