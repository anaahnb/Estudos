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

