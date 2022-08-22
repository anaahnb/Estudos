# um block pode ser entendido como uma fun��o an�nima, ou seja, uma fun��o sem nome.
5.times { puts "Exec the block" }


sum = 0
numbers = [5, 10, 5]
numbers.each {|number| sum += number } # as barras verticais s�o utilizadas para passar par�metros para um bloco
puts sum


foo = {2 => 3, 4 => 5}
foo.each do |key, value| # em blocos que ocupam v�rias linhas, usar do..end
    puts "key = #{key}"
    puts "value = #{value}"
    puts "key * value = #{key * value}"
end

# um bloco pode ser passado como  argumento impl�cito de um m�todo
def foo
    yield # para chamar dentro do m�todo o bloco que foi passado � utilizada a palavra yield
    yield # retornar� 2x
end
    
foo { puts "Exec the block"}
# Exec the block
# Exec the block

