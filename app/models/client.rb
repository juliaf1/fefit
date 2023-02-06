class Client < User

  def city
    if addresses.count > 0
      addresses.first.city
    else
      return 'Sem endereço'
    end
  end

end