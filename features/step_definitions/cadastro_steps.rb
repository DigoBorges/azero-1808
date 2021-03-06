require 'faker'

Dado('que estou na página de cadastro') do
  visit '/api/reset' # Gatenho
  visit '/cadastre-se'
end

Quando('faço o meu cadastro com') do |table|
  @usuario = table.rows_hash

  fill_in 'full-name', with: @usuario[:nome]
  fill_in 'email', with: @usuario[:email]
  fill_in 'password', with: @usuario[:senha]

  click_button 'Cadastrar'
end

Então('devo ver a mensagem {string}') do |mensagem_alerta|
  alerta = find('.s-alert-box')
  expect(alerta).to have_content mensagem_alerta
end
