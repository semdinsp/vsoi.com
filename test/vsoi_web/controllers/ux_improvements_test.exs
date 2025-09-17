defmodule VsoiWeb.UXImprovementsTest do
  use VsoiWeb.ConnCase

  describe "Homepage UX" do
    test "renders homepage with proper structure and accessibility", %{conn: conn} do
      conn = get(conn, ~p"/")
      assert html_response(conn, 200) =~ "Fresh, Organic"

      # Check for proper semantic structure
      assert html_response(conn, 200) =~ "<main"
      assert html_response(conn, 200) =~ "<header"
      assert html_response(conn, 200) =~ "<footer"

      # Check for proper heading hierarchy
      assert html_response(conn, 200) =~ "<h1"
      assert html_response(conn, 200) =~ "<h2"
      assert html_response(conn, 200) =~ "<h3"

      # Check for proper aria-labels and accessibility
      assert html_response(conn, 200) =~ "aria-label"
      assert html_response(conn, 200) =~ "VSOI Home"

      # Check for responsive navigation
      assert html_response(conn, 200) =~ "md:hidden"
      assert html_response(conn, 200) =~ "mobile-menu"
    end

    test "has proper icon components instead of manual spans", %{conn: conn} do
      conn = get(conn, ~p"/")
      response = html_response(conn, 200)

      # Should NOT have manual span-based icons with class combinations
      refute response =~ "span class=\"hero-sparkles text-white text-2xl\""
      refute response =~ "span class=\"hero-map-pin text-white text-2xl\""
      refute response =~ "span class=\"hero-heart text-white text-2xl\""

      # Should have proper icon components
      assert response =~ "hero-sparkles"
      assert response =~ "hero-map-pin"
      assert response =~ "hero-heart"
    end
  end

  describe "Team page UX" do
    test "renders team page with modal functionality", %{conn: conn} do
      conn = get(conn, ~p"/team")
      assert html_response(conn, 200) =~ "Meet Our Team"

      # Check for modal components
      assert html_response(conn, 200) =~ "eka_info"
      assert html_response(conn, 200) =~ "phx-click"

      # Check for proper accessibility
      assert html_response(conn, 200) =~ "aria-label"
      assert html_response(conn, 200) =~ "Learn more about Eka"

      # Check for proper icon usage - should not have manual span classes
      refute html_response(conn, 200) =~ "span class=\"hero-hand-heart text-white text-2xl\""
      assert html_response(conn, 200) =~ "hero-hand-heart"
    end
  end

  describe "Products page UX" do
    test "renders products page with consistent layout", %{conn: conn} do
      conn = get(conn, ~p"/products")
      assert html_response(conn, 200) =~ "Premium Organic Produce"

      # Check for proper icon components
      assert html_response(conn, 200) =~ "hero-heart"
      assert html_response(conn, 200) =~ "hero-leaf"

      # Check for proper email links
      assert html_response(conn, 200) =~ "sales.vsoi.tl@gmail.com"
      assert html_response(conn, 200) =~ "mailto:"
    end
  end

  describe "Vision page UX" do
    test "renders vision page with fixed image paths", %{conn: conn} do
      conn = get(conn, ~p"/vision")
      assert html_response(conn, 200) =~ "Our Vision & Mission"

      # Check for absolute image paths
      assert html_response(conn, 200) =~ "src=\"/images/"
      refute html_response(conn, 200) =~ "src=\"images/"

      # Check for proper icon components
      assert html_response(conn, 200) =~ "hero-eye"
      assert html_response(conn, 200) =~ "hero-target"
    end
  end

  describe "Global Navigation UX" do
    test "has consistent navigation across all pages", %{conn: conn} do
      pages = [~p"/", ~p"/team", ~p"/products", ~p"/vision"]

      for page <- pages do
        conn = get(conn, page)
        response = html_response(conn, 200)

        # Each page should have the unified header
        assert response =~ "bg-primary text-white sticky top-0"
        assert response =~ "VSOI"
        assert response =~ "Verde Smart Organiku International"

        # Check navigation links
        assert response =~ "href=\"/products\""
        assert response =~ "href=\"/team\""
        assert response =~ "href=\"/vision\""

        # Check for mobile menu
        assert response =~ "mobile-menu"
        assert response =~ "phx-click"
      end
    end
  end

  describe "Footer UX" do
    test "has improved footer across all pages", %{conn: conn} do
      pages = [~p"/", ~p"/team", ~p"/products", ~p"/vision"]

      for page <- pages do
        conn = get(conn, page)
        response = html_response(conn, 200)

        # Check for improved footer
        assert response =~ "role=\"contentinfo\""
        assert response =~ "2024 Verde Smart Organiku International"
        assert response =~ "sales.vsoi.tl@gmail.com"
        assert response =~ "hero-envelope"

        # Should have proper accessibility
        assert response =~ "aria-label=\"Contact us via email\""
      end
    end
  end

  describe "Accessibility Features" do
    test "all pages have proper accessibility attributes", %{conn: conn} do
      pages = [~p"/", ~p"/team", ~p"/products", ~p"/vision"]

      for page <- pages do
        conn = get(conn, page)
        response = html_response(conn, 200)

        # Check for semantic HTML structure
        assert response =~ "<main"
        assert response =~ "<header"
        assert response =~ "<footer"
        assert response =~ "role=\"navigation\""
        assert response =~ "role=\"contentinfo\""

        # Check for proper alt text and labels
        assert response =~ "alt="
        assert response =~ "aria-label"

        # Check for focus management
        assert response =~ "focus:outline-none"
        assert response =~ "focus:ring"
      end
    end
  end
end