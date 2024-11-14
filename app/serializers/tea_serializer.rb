class TeaSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :instruction, :price
end