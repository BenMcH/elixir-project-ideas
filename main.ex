{:ok, contents} = File.read('./products.txt')
products = contents |> String.split("\n", trim: true)

{:ok, contents} = File.read('./demographics.txt')
dempgraphics = contents |> String.split("\n", trim: true)

number = case IO.gets("How many product suggestions would you like?\n") |> String.trim |> Integer.parse do
  {x, ""} -> x
  _ -> exit('Invalid number')
end

defmodule Loop do
   def print_suggestion(func, n) when n <= 1 do
      func.()
   end

   def print_suggestion(func, n) do
      func.()
      print_suggestion(func, n - 1)
   end
end

product_suggestion = fn -> IO.puts(Enum.random(products) <> " for " <> Enum.random(dempgraphics)) end

Loop.print_suggestion(product_suggestion, number)
