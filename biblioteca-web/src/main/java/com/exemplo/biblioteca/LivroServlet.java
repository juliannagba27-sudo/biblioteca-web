package com.exemplo.biblioteca;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/livros")
public class LivroServlet extends HttpServlet {

    private static final List<Livro> livros = new ArrayList<>();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String titulo = req.getParameter("titulo");
        String autor = req.getParameter("autor");
        int ano = Integer.parseInt(req.getParameter("anoPublicacao"));

        livros.add(new Livro(titulo, autor, ano));
        resp.sendRedirect("livros");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String busca = req.getParameter("busca");

        List<Livro> resultado = livros;
        if (busca != null && !busca.isEmpty()) {
            resultado = livros.stream()
                    .filter(l -> l.getTitulo().toLowerCase().contains(busca.toLowerCase())
                              || l.getAutor().toLowerCase().contains(busca.toLowerCase()))
                    .collect(Collectors.toList());
        }

        req.setAttribute("livros", resultado);
        req.getRequestDispatcher("lista.jsp").forward(req, resp);
    }
}
