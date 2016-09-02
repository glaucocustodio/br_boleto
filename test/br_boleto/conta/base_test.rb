require 'test_helper'

describe BrBoleto::Remessa::Base do
	subject { FactoryGirl.build(:conta_base) }

	describe "Validations" do
		it { must validate_presence_of(:agencia) }
		it { must validate_presence_of(:razao_social) }
		it { must validate_presence_of(:cpf_cnpj) }

		context '#endereco' do
			it "por padrão não deve validar nada" do
				subject.endereco = nil
				wont_be_message_error(:endereco)
			end

			context "#endereco_required" do
				it "quando setado deve validar a obrigatoriedade" do
					wont validate_presence_of(:endereco)
					
					subject.endereco_required = true
					must validate_presence_of(:endereco)
				end
			end
		end

		context "#conta_corrente" do
			it "por padrão não deve validar nada" do
				subject.conta_corrente = nil
				wont_be_message_error(:conta_corrente)
			end

			context "#conta_corrente_required" do
				it "quando setado deve validar a obrigatoriedade" do
					wont validate_presence_of(:conta_corrente)
					
					subject.conta_corrente_required = true
					must validate_presence_of(:conta_corrente)
				end
			end
			context "#conta_corrente_length" do
				it "quando setado um valor deve validar através do valor setado" do
					subject.conta_corrente_length = 7
					subject.conta_corrente = '12345678'
					must_be_message_error(:conta_corrente, :custom_length_is, {count: 7})
					subject.conta_corrente = '1234567'
					wont_be_message_error(:conta_corrente, :custom_length_is, {count: 7})
				end
			end
			context "#conta_corrente_minimum" do
				it "quando setado um valor deve validar através do valor setado" do
					subject.conta_corrente_minimum = 5
					subject.conta_corrente = '1'
					must_be_message_error(:conta_corrente, :custom_length_minimum, {count: 5})
					subject.conta_corrente = '1234567'
					wont_be_message_error(:conta_corrente, :custom_length_minimum, {count: 5})
				end
			end
			context "#conta_corrente_maximum" do
				it "quando setado um valor deve validar através do valor setado" do
					subject.conta_corrente_maximum = 3
					subject.conta_corrente = '1234'
					must_be_message_error(:conta_corrente, :custom_length_maximum, {count: 3})
					subject.conta_corrente = '123'
					wont_be_message_error(:conta_corrente, :custom_length_maximum, {count: 3})
				end
			end
		end

		context "#modalidade" do
			it "por padrão não deve validar nada" do
				subject.modalidade = nil
				wont_be_message_error(:modalidade)
			end

			context "#modalidade_required" do
				it "quando setado deve validar a obrigatoriedade" do
					wont validate_presence_of(:modalidade)
					
					subject.modalidade_required = true
					must validate_presence_of(:modalidade)
				end
			end
			context "#modalidade_length" do
				it "quando setado um valor deve validar através do valor setado" do
					subject.modalidade_length = 7
					subject.modalidade = '12345678'
					must_be_message_error(:modalidade, :custom_length_is, {count: 7})
					subject.modalidade = '1234567'
					wont_be_message_error(:modalidade, :custom_length_is, {count: 7})
				end
			end
			context "#modalidade_minimum" do
				it "quando setado um valor deve validar através do valor setado" do
					subject.modalidade_minimum = 5
					subject.modalidade = '1'
					must_be_message_error(:modalidade, :custom_length_minimum, {count: 5})
					subject.modalidade = '1234567'
					wont_be_message_error(:modalidade, :custom_length_minimum, {count: 5})
				end
			end
			context "#modalidade_maximum" do
				it "quando setado um valor deve validar através do valor setado" do
					subject.modalidade_maximum = 3
					subject.modalidade = '1234'
					must_be_message_error(:modalidade, :custom_length_maximum, {count: 3})
					subject.modalidade = '123'
					wont_be_message_error(:modalidade, :custom_length_maximum, {count: 3})
				end
			end
		end

		context "#codigo_cedente" do
			it "por padrão não deve validar nada" do
				subject.codigo_cedente = nil
				wont_be_message_error(:codigo_cedente)
			end

			context "#codigo_cedente_required" do
				it "quando setado deve validar a obrigatoriedade" do
					wont validate_presence_of(:codigo_cedente)
					
					subject.codigo_cedente_required = true
					must validate_presence_of(:codigo_cedente)
				end
			end
			context "#codigo_cedente_length" do
				it "quando setado um valor deve validar através do valor setado" do
					subject.codigo_cedente_length = 7
					subject.codigo_cedente = '12345678'
					must_be_message_error(:codigo_cedente, :custom_length_is, {count: 7})
					subject.codigo_cedente = '1234567'
					wont_be_message_error(:codigo_cedente, :custom_length_is, {count: 7})
				end
			end
			context "#codigo_cedente_minimum" do
				it "quando setado um valor deve validar através do valor setado" do
					subject.codigo_cedente_minimum = 5
					subject.codigo_cedente = '1'
					must_be_message_error(:codigo_cedente, :custom_length_minimum, {count: 5})
					subject.codigo_cedente = '1234567'
					wont_be_message_error(:codigo_cedente, :custom_length_minimum, {count: 5})
				end
			end
			context "#codigo_cedente_maximum" do
				it "quando setado um valor deve validar através do valor setado" do
					subject.codigo_cedente_maximum = 3
					subject.codigo_cedente = '1234'
					must_be_message_error(:codigo_cedente, :custom_length_maximum, {count: 3})
					subject.codigo_cedente = '123'
					wont_be_message_error(:codigo_cedente, :custom_length_maximum, {count: 3})
				end
			end
		end

		context "#carteira" do
			it "por padrão não deve validar nada" do
				subject.carteira = nil
				wont_be_message_error(:carteira)
			end

			context "#carteira_required" do
				it "quando setado deve validar a obrigatoriedade" do
					wont validate_presence_of(:carteira)
					
					subject.carteira_required = true
					must validate_presence_of(:carteira)
				end
			end
			context "#carteira_length" do
				it "quando setado um valor deve validar através do valor setado" do
					subject.carteira_length = 7
					subject.carteira = '12345678'
					must_be_message_error(:carteira, :custom_length_is, {count: 7})
					subject.carteira = '1234567'
					wont_be_message_error(:carteira, :custom_length_is, {count: 7})
				end
			end
			context "#carteira_minimum" do
				it "quando setado um valor deve validar através do valor setado" do
					subject.carteira_minimum = 5
					subject.carteira = '1'
					must_be_message_error(:carteira, :custom_length_minimum, {count: 5})
					subject.carteira = '1234567'
					wont_be_message_error(:carteira, :custom_length_minimum, {count: 5})
				end
			end
			context "#carteira_maximum" do
				it "quando setado um valor deve validar através do valor setado" do
					subject.carteira_maximum = 3
					subject.carteira = '1234'
					must_be_message_error(:carteira, :custom_length_maximum, {count: 3})
					subject.carteira = '123'
					wont_be_message_error(:carteira, :custom_length_maximum, {count: 3})
				end
			end
		end

		context "#convenio" do
			it "por padrão não deve validar nada" do
				subject.convenio = nil
				wont_be_message_error(:convenio)
			end

			context "#convenio_required" do
				it "quando setado deve validar a obrigatoriedade" do
					wont validate_presence_of(:convenio)
					
					subject.convenio_required = true
					must validate_presence_of(:convenio)
				end
			end
			context "#convenio_length" do
				it "quando setado um valor deve validar através do valor setado" do
					subject.convenio_length = 7
					subject.convenio = '12345678'
					must_be_message_error(:convenio, :custom_length_is, {count: 7})
					subject.convenio = '1234567'
					wont_be_message_error(:convenio, :custom_length_is, {count: 7})
				end
			end
			context "#convenio_minimum" do
				it "quando setado um valor deve validar através do valor setado" do
					subject.convenio_minimum = 5
					subject.convenio = '1'
					must_be_message_error(:convenio, :custom_length_minimum, {count: 5})
					subject.convenio = '1234567'
					wont_be_message_error(:convenio, :custom_length_minimum, {count: 5})
				end
			end
			context "#convenio_maximum" do
				it "quando setado um valor deve validar através do valor setado" do
					subject.convenio_maximum = 3
					subject.convenio = '1234'
					must_be_message_error(:convenio, :custom_length_maximum, {count: 3})
					subject.convenio = '123'
					wont_be_message_error(:convenio, :custom_length_maximum, {count: 3})
				end
			end
		end
	end

	it "carteira deve retornar sempre uma string se tiver um valor" do
		subject.carteira = 123
		subject.carteira.must_equal '123'
		subject.carteira = nil
		subject.carteira.must_be_nil
	end

	it "agencia deve retornar sempre uma string se tiver um valor" do
		subject.agencia = 123
		subject.agencia.must_equal '123'
		subject.agencia = nil
		subject.agencia.must_be_nil
	end

	it "codigo_cedente deve retornar sempre uma string se tiver um valor" do
		subject.codigo_cedente = 123
		subject.codigo_cedente.must_equal '123'
		subject.codigo_cedente = nil
		subject.codigo_cedente.must_be_nil
	end

	describe "NotImplementedError" do
		it "codigo_banco" do
			assert_raises NotImplementedError do
				subject.codigo_banco
			end
		end

		it "nome_banco" do
			subject.nome_banco = nil
			assert_raises NotImplementedError do
				subject.nome_banco
			end
		end

		it "codigo_banco_dv" do
			assert_raises NotImplementedError do
				subject.codigo_banco_dv
			end
		end
		it "versao_layout_arquivo_cnab_240" do
			assert_raises NotImplementedError do
				subject.versao_layout_lote_cnab_240
			end
		end
		it "versao_layout_lote_cnab_240" do
			assert_raises NotImplementedError do
				subject.versao_layout_lote_cnab_240
			end
		end
	end

	describe "#codigo_banco_formatado" do
		it "deve trazer o codigo do banco e o dv separados por ifen" do
			subject.expects(:codigo_banco).returns(6578)
			subject.expects(:codigo_banco_dv).returns(9)
			subject.codigo_banco_formatado.must_equal '6578-9'
		end
	end

	describe "#agencia_codigo_cedente" do
		it "deve trazer a agencia e o dv separados por /" do
			subject.expects(:agencia).returns(956781)
			subject.expects(:codigo_cedente).returns(9)
			subject.agencia_codigo_cedente.must_equal '956781 / 9'
		end
	end

		describe "#cpf_cnpj" do
		it "se setar o cnpj com a pontuação deve sempre retornar apenas os numeros" do
			subject.cpf_cnpj = '84.059.146/0001-00'
			subject.cpf_cnpj.must_equal '84059146000100'
		end
		it "se setar o CPF com a pontuação deve sempre retornar apenas os numeros" do
			subject.cpf_cnpj = '725.211.506-22'
			subject.cpf_cnpj.must_equal '72521150622'
		end
	end

	describe "#tipo_cpf_cnpj" do
		context "#CPF retorna 01" do
			it "por padrão deve retornar 01 (com 2 digitos)" do
				subject.cpf_cnpj = '725.211.506-22'
				subject.tipo_cpf_cnpj.must_equal '01'
			end
			it "posso passar a quantidade de digitos a retornar" do
				subject.cpf_cnpj = '83944180313'
				subject.tipo_cpf_cnpj(1).must_equal '1'
			end
		end
		context "#CNPJ retorna 02" do
			it "por padrão deve retornar 02 (com 2 digitos)" do
				subject.cpf_cnpj = '84059146000100'
				subject.tipo_cpf_cnpj.must_equal '02'
			end
			it "posso passar a quantidade de digitos a retornar" do
				subject.cpf_cnpj = '32.131.445/0001-05'
				subject.tipo_cpf_cnpj(1).must_equal '2'
			end
		end
	end

	describe "#cpf_cnpj_formatado" do
		it "deve retornar o cnpj com a pontuação correta" do
			subject.cpf_cnpj = '84059146000100'
			subject.cpf_cnpj_formatado.must_equal '84.059.146/0001-00'
		end
		it "deve retornar o CPF com a pontuação correta" do
			subject.cpf_cnpj = '72521150622'
			subject.cpf_cnpj_formatado.must_equal '725.211.506-22'
		end
	end

	describe "#cpf_cnpj_formatado_com_label" do
		it "deve retornar o cnpj com a pontuação correta e com o label CNPJ" do
			subject.cpf_cnpj = '84059146000100'
			subject.cpf_cnpj_formatado_com_label.must_equal 'CNPJ 84.059.146/0001-00'
		end
		it "deve retornar o CPF com a pontuação correta e com o label CPF" do
			subject.cpf_cnpj = '72521150622'
			subject.cpf_cnpj_formatado_com_label.must_equal 'CPF 725.211.506-22'
		end
	end

	
end