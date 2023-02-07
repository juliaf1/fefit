module LocationManager
  class ZipCodeAreaValidator

    API_BASE_URL = 'https://brasilapi.com.br/api/cep/v1'

    AVAILABLE_LOCATIONS = {
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
    }

    def initialize(zipcode)
      @zipcode = clean_zipcode(zipcode)
    end

    def call
      validate_area
    end

    private

    def validate_area
      case @zipcode.first(3)
      when AVAILABLE_LOCATIONS[:buzios][:zipcode]
        return validate_buzios_zipcode
      when AVAILABLE_LOCATIONS[:macae][:zipcode]
        return validate_macae_zipcode
      else
        return {
          success: false
        }
      end
    end

    def validate_macae_zipcode
      response = HTTParty.get("#{API_BASE_URL}/#{@zipcode}")

      if response.code == 200
        address = response.body

        if AVAILABLE_LOCATIONS[:macae][:available_areas].include?(address.neighborhood)
          return {
            success: true,
            address: {
              zipcode: address.cep,
              state: address.state,
              city: address.city,
              neighborhood: address.neighborhood,
              street: address.street,
            }
          }
        else
          return {
            success: false
          }
        end
      else
        return {
          success: false
        }
      end
    end

    def validate_buzios_zipcode
      if @zipcode == AVAILABLE_LOCATIONS[:buzios][:default_zip_code]
        return {
          success: true,
          address: {
            zipcode: zipcode,
            state: 'RJ',
            city: 'Armação dos Búzios',
            neighborhood: 'Búzios - CEP Geral',
          }
        }
      end

      response = HTTParty.get("#{API_BASE_URL}/#{@zipcode}")

      puts response
  
      if response.code == 200
        address = response.body
        return {
          success: true,
          address: {
            zipcode: address.cep,
            state: address.state,
            city: address.city,
            neighborhood: address.neighborhood,
            street: address.street,
          }
        }
      else
        return {
          success: false
        }
      end
    end

    def clean_zipcode(zipcode)
      return zipcode.gsub(/[^a-zA-Z0-9 ]/, '')
    end

  end
end