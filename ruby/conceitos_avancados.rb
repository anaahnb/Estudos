# um block pode ser entendido como uma função anônima, ou seja, uma função sem nome.
5.times { puts "Exec the block" }


sum = 0
numbers = [5, 10, 5]
numbers.each {|number| sum += number } # as barras verticais são utilizadas para passar parâmetros para um bloco
puts sum


foo = {2 => 3, 4 => 5}
foo.each do |key, value| # em blocos que ocupam várias linhas, usar do..end
    puts "key = #{key}"
    puts "value = #{value}"
    puts "key * value = #{key * value}"
end

# um bloco pode ser passado como  argumento implícito de um método
def foo
    yield # para chamar dentro do método o bloco que foi passado é utilizada a palavra yield
    yield # retornará 2x
end
    
foo { puts "Exec the block"}
# Exec the block
# Exec the block

def boo
    if block_given? # torna o bloco opcional
      yield
    else
      puts "Sem parâmetro do tipo bloco"
    end
end 
boo # primeiro entra no else
boo { puts "Com parâmetro do tipo bloco"} # depois entra no if 


def poo(name, &block) # para receber o bloco é necessário usar &
 @name = name
 block.call # chama o bloco. é como se ele fosse injetado aqui
end
poo('Ana') { puts "Hellow #{@name}" }

# passando um bloco que ocupa varias linhas como parametro
def de(numbers, &block) 
    if block_given?
        numbers.each do |key, value|
        block.call(key, value)
        end
    end
end
numbers = { 2 => 2, 3 => 3, 4 => 4 }
de(numbers) do |key, value|
    puts "#{key} * #{value} = #{key * value}"
    puts "#{key} + #{value} = #{key + value}"
    puts "---"
end



# lambdas segue a mesma lógica que os blocks, mas podem ser guardadas em variaeis
lambda1 = lambda { puts "my first lambda"}
lambda2 = -> { puts "my first lambda"} # abreviação
first_lambda.call

# é possivel receber parametros e blocos de multiplas linhas
my_lambda = lambda do |numbers|
    index = 0
    puts 'Número atual + Próximo número'
    numbers.each do |number|
        return if numbers[index] == numbers.last
        puts "(#{numbers[index]}) + (#{numbers[index + 1]})"
        puts numbers[index] + numbers[index + 1]
        index += 1
    end
end
numbers = [1, 2, 3, 4]
my_lambda.call(numbers)
