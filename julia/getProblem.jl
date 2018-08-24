using AbstractTrees
using HTTP
using Gumbo

println("-----")

request = HTTP.request("GET", "https://projecteuler.net/problem=4");
requestBody = String(request.body);

html = parsehtml(requestBody).root
body = html.children[2]

paragraphs = []
for elem in PreOrderDFS(body)
    try
        if tag(elem) == :p
            push!(paragraphs, elem)
        end
    catch
    end
end

for p in paragraphs
    for c in p.children
        println(text(c))
    end
end
