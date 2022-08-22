# saída de dado
print 'Digite seu n+ome: '
# Recebendo uma entrada do teclado
name = gets.chomp
# saída utilizando puts
# use códigos ruby dentro de uma string com #{code}
puts "Hello #{name}!"


print "Digite o primeiro número inteiro: "
# .to_i transforma a string em um número inteiro
number1 = gets.chomp.to_i
print "Digite o segundo número inteiro: "
number2 = gets.chomp.to_i
addition = number1 + number2
puts "O resultado da adição entre os dois números é #{addition}"



number3 = 7 # number3.class retornará inteiro
number4 = 4.47 # number3.class retornará float
ruby = true # ruby.class retornará boolean
word = "hello world" # word.class retornará string



def hey_ho?
    true
  end
  
puts "let’s go" if hey_ho?



# enquanto a expressão for verdadeira (true), o código do corpo do while é executado. assim, irá retornar de 1 até 10:
num = 1
while num <= 10
  puts num
  num += 1
end

# é definida a variável num ao bloco e uma expressão. este código irá imprimir o mesmo que o código de while (1 até 10):
for num in 1...10
    puts num
  end

# semelhante ao while, mas com a diferença que a condição é checada depois de executar as expressões
loop do
    puts "GeeksforGeeks"
    val = '7'
    if val == '8'
        break
    end
end

# vai executar a expressão até que a condição seja verdadeira. basicamente o contrário de while
var = 7
until var == 11 do
    puts var * 10
    var = var + 1
end



# Arrays
 
bookshelf = []
bookshelf.push("As vantagens de ser invisivel") # adicionando elementos 
bookshelf << "Speak" # outra forma de adicionar
puts bookshelf[0] # retornando um valor (As vantagens de ser invisivel)
puts bookshelf[1] # (Speak)

# imprimindo arrays
bookshelf.each do |book|
    puts book
end

for i in bookshelf do 
    puts i
end
# a principal diferença é que o each mantém apenas a variável dentro do bloco de iteração
# enquanto que o for permite que a variável seja chamada no exterior do bloco.

hash = {
    "name" => "Ana",
    "age" => 18
  }
  
puts "Meu nome é #{hash["name"]} e tenho #{hask["age"]} anos" 
# retorna o valor através da key (Meu nome é Ana e tenho 18 anos)

hash.each do |attribute, value|
    puts "#{attribute}: #{value}"
end

# utilizando gems
require 'os'
def my_os
    if OS.windows?
        "Windows"
    elsif OS.linux?
        "Linux"
    elsif OS.mac?
        "Osx"
    else
        "Não consegui identificar" 
    end
end
puts "Meu PC possui #{OS.cpu_count} cores, é #{OS.bits} bits e o sistema operacional é #{my_os}"

# https://medium.com/codica/40-best-ruby-gems-we-cant-live-without-8ccf314fcd38
# https://rubygems.org/



# source: https://www.freecodecamp.org/news/learning-ruby-from-zero-to-hero-90ad4eecc82d/