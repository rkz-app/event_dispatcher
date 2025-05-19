docker run -d \
  -e ERL_COOKIE="supersecretcookie" \
  -e SECRET_KEY_BASE="$(mix phx.gen.secret)" \
  -e API_KEY="my-super-secret-api-key" \
  -e PHX_HOST="example.com" \
  -e PORT=4000 \
  -e PHX_SERVER=true \
  -p 4000:4000 \
  event_dispatcher