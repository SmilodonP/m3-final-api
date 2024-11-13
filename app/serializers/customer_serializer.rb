class CustomerSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :phone, :email, :st_address, :city, :state, :zip
end
