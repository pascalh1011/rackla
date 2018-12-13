defimpl Jason.Encoder, for: [Rackla.Request] do
  def encode(struct, opts) do
    Jason.Encode.map(struct, opts)
  end
end
