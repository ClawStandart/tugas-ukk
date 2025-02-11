// Toggle the Read Content section
function toggleReadContent(bookId) {
    var contentSection = document.getElementById('book-content-' + bookId);
    var readButton = document.getElementById('read-button-' + bookId);
    if (contentSection.style.display === "none") {
        contentSection.style.display = "block";
        readButton.innerText = "Hide Content";
    } else {
        contentSection.style.display = "none";
        readButton.innerText = "Read the Book";
    }
}

// Navbar toggle for small screens
document.addEventListener('DOMContentLoaded', function() {
    // Navbar toggle button
    const navbarToggle = document.querySelector('.navbar-toggle');
    const navbarMenu = document.querySelector('.nav-links');

    if (navbarToggle) {
        navbarToggle.addEventListener('click', function() {
            navbarMenu.classList.toggle('active');
        });
    }

    // Close menu on link click for mobile responsiveness
    const navLinks = document.querySelectorAll('.nav-links a');
    navLinks.forEach(link => {
        link.addEventListener('click', function() {
            if (window.innerWidth <= 768) {
                navbarMenu.classList.remove('active');
            }
        });
    });

    // Dropdown menu hover effect
    const dropdowns = document.querySelectorAll('.dropdown');
    dropdowns.forEach(dropdown => {
        dropdown.addEventListener('mouseover', function() {
            dropdown.querySelector('.dropdown-content').style.display = 'block';
        });

        dropdown.addEventListener('mouseout', function() {
            dropdown.querySelector('.dropdown-content').style.display = 'none';
        });
    });
});

// Favorite Books System
document.addEventListener('DOMContentLoaded', function() {
    const favoriteButtons = document.querySelectorAll('.favorite-button');
    favoriteButtons.forEach(button => {
        button.addEventListener('click', function() {
            const bookId = this.closest('.book-item').getAttribute('data-book-id');
            let favorites = JSON.parse(localStorage.getItem('favorites')) || [];
            if (favorites.includes(bookId)) {
                favorites = favorites.filter(id => id !== bookId);
            } else {
                favorites.push(bookId);
            }
            localStorage.setItem('favorites', JSON.stringify(favorites));
            updateFavoriteButtonState(bookId);
        });
    });

    // Update the favorite button state based on localStorage
    function updateFavoriteButtonState(bookId) {
        const button = document.querySelector(`.book-item[data-book-id="${bookId}"] .favorite-button`);
        let favorites = JSON.parse(localStorage.getItem('favorites')) || [];
        if (favorites.includes(bookId)) {
            button.classList.add('active');
        } else {
            button.classList.remove('active');
        }
    }

    // Initial setup for favorites
    document.querySelectorAll('.book-item').forEach(item => {
        const bookId = item.getAttribute('data-book-id');
        updateFavoriteButtonState(bookId);
    });
});

// Search Functionality
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('search-bar');
    const bookItems = document.querySelectorAll('.book-item');
    
    searchInput.addEventListener('input', function() {
        const query = searchInput.value.toLowerCase();
        bookItems.forEach(item => {
            const title = item.querySelector('.title').textContent.toLowerCase();
            if (title.includes(query)) {
                item.style.display = 'block';
            } else {
                item.style.display = 'none';
            }
        });
    });
});

// Sort Functionality
document.addEventListener('DOMContentLoaded', function() {
    const sortBySelect = document.getElementById('sort-by');
    const bookItems = document.querySelectorAll('.book-item');

    sortBySelect.addEventListener('change', function() {
        const sortBy = sortBySelect.value;
        const bookItemsArray = [...bookItems];

        bookItemsArray.sort((a, b) => {
            const aText = a.querySelector(`.${sortBy}`).textContent.toLowerCase();
            const bText = b.querySelector(`.${sortBy}`).textContent.toLowerCase();
            return aText.localeCompare(bText);
        });

        const bookGrid = document.querySelector('.book-grid');
        bookGrid.innerHTML = '';  // Clear the grid
        bookItemsArray.forEach(item => {
            bookGrid.appendChild(item);
        });
    });
});

// Pagination Functionality
document.addEventListener('DOMContentLoaded', function() {
    const paginationContainer = document.getElementById('pagination');
    const booksPerPage = 5;
    const bookItems = document.querySelectorAll('.book-item');

    function paginate(page) {
        const startIndex = (page - 1) * booksPerPage;
        const endIndex = page * booksPerPage;

        bookItems.forEach((item, index) => {
            if (index >= startIndex && index < endIndex) {
                item.style.display = 'block';
            } else {
                item.style.display = 'none';
            }
        });
    }

    function createPagination() {
        const totalPages = Math.ceil(bookItems.length / booksPerPage);
        paginationContainer.innerHTML = ''; // Clear pagination
        
        for (let i = 1; i <= totalPages; i++) {
            const pageButton = document.createElement('button');
            pageButton.textContent = i;
            pageButton.addEventListener('click', function() {
                paginate(i);
            });
            paginationContainer.appendChild(pageButton);
        }
    }

    createPagination();
    paginate(1); // Show the first page by default
});

// Genre Dropdown toggle
document.addEventListener("DOMContentLoaded", function () {
    const searchInput = document.querySelector('input[name="search"]');
    const genreSelect = document.querySelector('select[name="genre"]');

    genreSelect.style.display = "none"; // Hide genre selection initially

    // Show genre select when the search input is focused
    searchInput.addEventListener("focus", function () {
        genreSelect.style.display = "inline-block";
    });

    // Optionally hide genre selection when search input loses focus
    searchInput.addEventListener("blur", function () {
        if (!searchInput.value) {
            genreSelect.style.display = "none";
        }
    });
});
