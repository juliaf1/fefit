module LocationManager
  class ZipCodeAreaValidator

    AVAILABLE_LOCATIONS = [
      buzios: {
        name: 'Armação dos Búzios',
        zipcode: '289',
        default_zip_code: '28950000',
      },
      macae: {
        name: 'Macaé',
        zipcode: '279',
        available_areas: ['', '',]
      }
    ]

    def initialize(zipcode)
      @zipcode = clean_zipcode(zipcode)
    end

    def call
    end

    private

    def validate_area
      if @zipcode == AVAILABLE_LOCATIONS.buzios.default_zip_code
        return { success: true }
      elsif @zipcode.first(3) == AVAILABLE_LOCATIONS.buzios.zipcode
        validate_zipcode
      elsif @zipcode.first(3) == AVAILABLE_LOCATIONS.macae.zipcode
        validate_zipcode
      else
        return { success: false }
      end
    end

    def validate_zipcode
    end

    def clean_zipcode(zipcode)
      return zipcode.gsub(/[^a-zA-Z0-9 ]/, '')
    end

  end
end