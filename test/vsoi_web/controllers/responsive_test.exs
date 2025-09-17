defmodule VsoiWeb.ResponsiveTest do
  use VsoiWeb.ConnCase

  describe "mobile responsive design" do
    test "home page has mobile-friendly layout", %{conn: conn} do
      conn = get(conn, ~p"/")
      html = html_response(conn, 200)

      # Check for mobile-responsive classes
      assert html =~ "sm:text-6xl"  # Responsive text sizing
      assert html =~ "flex-col sm:flex-row"  # Mobile-first button layout
      assert html =~ "grid-cols-1 md:grid-cols-3"  # Responsive grid
      assert html =~ "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"  # Responsive container
    end

    test "products page has mobile-friendly product cards", %{conn: conn} do
      conn = get(conn, ~p"/products")
      html = html_response(conn, 200)

      # Check for mobile-responsive product layout
      assert html =~ "grid-cols-1 lg:grid-cols-2 xl:grid-cols-3"  # Responsive product grid
      assert html =~ "flex-col sm:flex-row sm:justify-between"  # Mobile-first product actions
      assert html =~ "w-full sm:w-auto"  # Responsive button sizing
      assert html =~ "text-xl sm:text-2xl"  # Responsive text sizing
    end

    test "team page has mobile-friendly team cards", %{conn: conn} do
      conn = get(conn, ~p"/team")
      html = html_response(conn, 200)

      # Check for mobile-responsive team layout
      assert html =~ "grid-cols-1 md:grid-cols-2 lg:grid-cols-3"  # Responsive team grid
      assert html =~ "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"  # Responsive container
    end

    test "vision page has mobile-friendly layout", %{conn: conn} do
      conn = get(conn, ~p"/vision")
      html = html_response(conn, 200)

      # Check for mobile-responsive vision layout
      assert html =~ "md:flex"  # Responsive flex layout
      assert html =~ "grid-cols-1 md:grid-cols-2 lg:grid-cols-4"  # Responsive core values grid
      assert html =~ "grid-cols-1 md:grid-cols-3"  # Responsive impact goals grid
    end
  end

  describe "navigation responsiveness" do
    test "navigation has mobile-friendly design", %{conn: conn} do
      conn = get(conn, ~p"/team")  # Test a page with the standard header
      html = html_response(conn, 200)

      # Check for mobile navigation features
      assert html =~ "hidden sm:block"  # Text hidden on small screens, visible on larger
      assert html =~ "flex items-center justify-between"  # Mobile-friendly layout
      assert html =~ "px-4 sm:px-6 lg:px-8"  # Responsive padding
    end
  end

  describe "typography responsiveness" do
    test "text scales appropriately across devices", %{conn: conn} do
      conn = get(conn, ~p"/")
      html = html_response(conn, 200)

      # Check for responsive typography
      assert html =~ "text-4xl sm:text-6xl"  # Main heading responsive
      assert html =~ "text-xl"  # Readable on mobile
      assert html =~ "text-3xl"  # Section headings
    end
  end

  describe "button responsiveness" do
    test "buttons adapt to mobile screens", %{conn: conn} do
      conn = get(conn, ~p"/products")
      html = html_response(conn, 200)

      # Check for responsive buttons
      assert html =~ "w-full sm:w-auto"  # Full width on mobile, auto on desktop
      assert html =~ "flex-col sm:flex-row"  # Stack on mobile, row on desktop
      assert html =~ "btn-lg"  # Appropriate button sizing
    end

    test "call-to-action buttons are mobile-friendly", %{conn: conn} do
      conn = get(conn, ~p"/")
      html = html_response(conn, 200)

      # Check CTA buttons
      assert html =~ "flex flex-col sm:flex-row gap-4"  # Mobile-first CTA layout
      assert html =~ "btn-lg"  # Touch-friendly size
    end
  end

  describe "form responsiveness" do
    test "contact forms are mobile-friendly", %{conn: conn} do
      conn = get(conn, ~p"/products")
      html = html_response(conn, 200)

      # Check email links and contact methods
      assert html =~ "mailto:"  # Email links work on mobile
      assert html =~ "btn-primary"  # Styled consistently
    end
  end

  describe "image responsiveness" do
    test "images have responsive classes", %{conn: conn} do
      conn = get(conn, ~p"/team")
      html = html_response(conn, 200)

      # Check for responsive images
      assert html =~ "object-cover"  # Proper image scaling
      assert html =~ "w-32 h-32"  # Consistent sizing
      assert html =~ "rounded-full"  # Styled consistently
    end
  end

  describe "DaisyUI theme integration" do
    test "custom VSOI theme is applied", %{conn: conn} do
      conn = get(conn, ~p"/")
      html = html_response(conn, 200)

      # Check for DaisyUI theme usage
      assert html =~ "data-theme=\"vsoi\""  # Custom theme applied
      assert html =~ "btn-primary"  # DaisyUI button classes
      assert html =~ "btn-outline"  # DaisyUI variant classes
    end

    test "DaisyUI components work correctly", %{conn: conn} do
      conn = get(conn, ~p"/products")
      html = html_response(conn, 200)

      # Check DaisyUI component usage
      assert html =~ "btn "  # DaisyUI button base class
      assert html =~ "rounded-lg"  # DaisyUI styling
    end
  end
end