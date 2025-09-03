<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Mehmet Bener — Portfolio</title>
  <meta name="description" content="Mehmet Bener | Student at Hisar School & Researcher at ideaLab." />
  <style>
    :root {
      --bg: #ffffff;
      --text: #111111;
      --link: #0b5ed7;
      --muted: #666666;
      --border: #dddddd;
    }
    * { box-sizing: border-box; }
    body {
      margin: 0;
      font-family: Arial, Helvetica, sans-serif;
      background: var(--bg);
      color: var(--text);
      line-height: 1.45;
    }
    header, main, footer {
      max-width: 900px;
      margin: 0 auto;
      padding: 12px 16px;
    }
    header {
      border-bottom: 1px solid var(--border);
      display: flex;
      align-items: center;
      justify-content: space-between;
    }
    nav a {
      margin-right: 12px;
      text-decoration: none;
      color: var(--link);
      font-weight: bold;
    }
    nav a[aria-current="page"] {
      text-decoration: underline;
    }
    h1 { font-size: 24px; margin: 0; }
    h2 { font-size: 20px; margin-top: 0; }
    .page {
      display: none;
      padding: 16px 0;
      border-bottom: 1px solid var(--border);
    }
    .page:last-of-type { border-bottom: 0; }
    .muted { color: var(--muted); }
    footer {
      border-top: 1px solid var(--border);
      margin-top: 24px;
      padding-top: 16px;
      font-size: 14px;
    }
    .links {
      display: flex;
      gap: 10px;
      flex-wrap: wrap;
      margin-top: 8px;
    }
    .links a {
      border: 1px solid var(--border);
      padding: 6px 10px;
      text-decoration: none;
      color: var(--link);
      border-radius: 4px;
      font-size: 14px;
    }
    .video-container {
      max-width: 700px;
      width: 100%;
      margin-top: 10px;
      margin-bottom: 20px;
    }
    .video-container video {
      width: 100%;
      height: auto;
      display: block;
      border: 1px solid var(--border);
      border-radius: 6px;
    }
    img {
      max-width: 100%;
      border: 1px solid var(--border);
      border-radius: 6px;
      margin-top: 10px;
    }
  </style>
</head>
<body>
  <header>
    <div><strong>Mehmet Bener</strong></div>
    <nav aria-label="Primary">
      <a href="#home" id="nav-home">Home</a>
      <a href="#projects" id="nav-projects">Projects</a>
      <a href="#big-ideas" id="nav-big-ideas">Big Ideas</a>
      <a href="#documentation" id="nav-documentation">Documentation</a>
    </nav>
  </header>

  <main>
    <div id="home" class="page" data-title="Home — Mehmet Bener">
      <h2>Home</h2>
      <div class="muted">Student at Hisar School | Researcher at ideaLab</div>
      <div>I’m a high school sophomore interested in robotics, AI, and programming. I’ve contributed to FRC Team 6431, published research at international conferences, and supported STEM outreach through mentoring and workshops.</div>
    </div>

    <div id="projects" class="page" data-title="Projects — Mehmet Bener">
      <h2>AP CS Principles Projects</h2>
      <div>
        <strong>X-O-X Game on Scratch</strong>
        <div style="height:8px;"></div>
        <a href="https://scratch.mit.edu/projects/1212451713" target="_blank" rel="noopener noreferrer">Scratch Project Link</a>
        <div style="height:8px;"></div>
        <a href="https://github.com/MehmetBener/AP-CS-Principles-Projects/tree/main/Scratch_Tic-Tac_Toe" target="_blank" rel="noopener noreferrer">Github Source Code</a>
        <div style="height:8px;"></div>
        <div>Here's a short demo video of my Scratch X-O-X game:</div>
        <div class="video-container">
          <video controls>
            <source src="/assets/XOX_Demo.mp4" type="video/mp4">
            Your browser does not support the video tag.
          </video>
        </div>
      </div>
      <div>
        <strong>X-O-X UI using Swift</strong>
        <div style="height:8px;"></div>
        <a href="https://github.com/MehmetBener/AP-CS-Principles-Projects/tree/main/Swift_Tic-Tac-Toe_UI" target="_blank" rel="noopener noreferrer">Github Source Code</a>
        <div style="height:8px;"></div>
        <div>Here's the UI design for my Swift-based X-O-X UI:</div>
        <img src="/assets/XOX_UI.png" alt="X-O-X Swift UI Design">
      </div>
      <div>
        <strong>Calculator using Swift</strong>
        <div style="height:8px;"></div>
        <a href="https://github.com/MehmetBener/AP-CS-Principles-Projects/tree/main/Swift_Calculator" target="_blank" rel="noopener noreferrer">Github Source Code</a>
        <div style="height:8px;"></div>
        <div>Here's a short demo video of the calculator:</div>
        <div class="video-container">
          <video controls>
            <source src="/assets/calculator.mp4" type="video/mp4">
            Your browser does not support the video tag.
          </video>
        </div>
      </div>
    </div>

    <div id="big-ideas" class="page" data-title="Big Ideas — Mehmet Bener">
      <h2>Big Ideas</h2>
      <div></div>
    </div>

    <div id="documentation" class="page" data-title="Documentation — Mehmet Bener">
        <div style="font-size:20px;font-weight:700;margin:0 0 12px;">Documentation</div>
      
        <div style="font-weight:700;">X-O-X Game Using Scratch</div>
        <div style="height:8px;"></div>
        <a href="https://scratch.mit.edu/projects/1212451713" target="_blank" rel="noopener noreferrer">Scratch Project Link</a>
        <div style="height:8px;"></div>
        <a href="https://github.com/MehmetBener/AP-CS-Principles-Projects/tree/main/Scratch_Tic-Tac_Toe" target="_blank" rel="noopener noreferrer">Github Source Code</a>
        <div style="height:8px;"></div>
        <div style="font-weight:700;">Video</div>
        <div class="video-container">
            <video controls>
              <source src="/assets/Scratch.mp4" type="video/mp4">
              Your browser does not support the video tag.
            </video>
        </div>
        <div style="height:8px;"></div>
        <div style="font-weight:700;">Overview</div>
        <div style="height:8px;"></div>
        <div>This Scratch version uses one button sprite per square and two overlay sprites (X and O) for that square. A small variable controls which symbol is shown.</div>
        <div style="height:8px;"></div>

        <div style="font-weight:700;">Key Idea</div>
        <div>Each square has a variable named like “my variable”. Values mean: 0 = empty, 1 = show X, 2 = show O.</div>
        <div style="height:8px;"></div>

        <div style="font-weight:700;">How It Works</div>
        <div>On green flag, set the squares variable to 0.</div>
        <div>When the square's button sprite is clicked, if the value is 0 or 2, set it to 1; otherwise set it to 2.</div>
        <div>The X sprite for that cell runs forever: if the variable = 1 then show, else hide.</div>
        <div>The O sprite for that cell runs forever: if the variable = 2 then show, else hide.</div>
        <div>This pattern is repeated for all nine squares.</div>
        <div style="height:8px;"></div>

        <div style="font-weight:700;">Limitations Right Now</div>
        <div>No turn order; players can flip a cell back and forth.</div>
        <div>No win or draw detection.</div>
        <div>No board reset button.</div>
        <div>Each cell is independent. There is no shared game state.</div>
        <div style="height:8px;"></div>

        <div style="height:28px;"></div>
      
        <div style="font-weight:700;">X-O-X UI Using Swift Playground</div>
        <div style="height:8px;"></div>
        <a href="https://github.com/MehmetBener/AP-CS-Principles-Projects/tree/main/Swift_Tic-Tac-Toe_UI" target="_blank" rel="noopener noreferrer">Github Source Code</a>
        <div style="height:8px;"></div>
        <div style="font-weight:700;">Video</div>
        <div class="video-container">
            <video controls>
              <source src="/assets/Swift.mp4" type="video/mp4">
              Your browser does not support the video tag.
            </video>
        </div>
        <div style="height:8px;"></div>
        <div style="font-weight:700;">Overview</div>
        <div style="height:8px;"></div>
        <div>This SwiftUI Playground builds a simple layout for a tic-tac-toe board. It positions nine blue squares and overlays X's and O's.</div>
        <div style="height:8px;"></div>
      
        <div style="font-weight:700;">How It Works</div>
        <div>Everything is inside a ZStack so boxes and texts can overlap. Each rectangle is a blue square made with Rectangle().frame(width:120,height:120). Text views for X or O are layered above the squares.</div>
        <div>Boxes are placed using .offset(...) with x and y values of −140, 0, or 140 to form a 3×3 grid around the center.</div>
        <div style="height:8px;"></div>
      
        <div style="font-weight:700;">Limitations Right Now</div>
        <div>No tap handling or turns.</div>
        <div>No data storage to store X/O state.</div>
        <div>No win/draw detection or reset.</div>
        <div>Fixed sizes and offsets; not adaptive to different screens.</div>
        <div style="height:8px;"></div>
      
        <div style="font-weight:700;">Next Steps</div>
        <div>Replace manual offsets with an adaptive grid.</div>
        <div>Store X/O per cell.</div>
        <div>Implement placing moves.</div>
        <div>Write a function to check winning and losing and a button to reset the board.</div>
        <div style="height:28px;"></div>        
  
        <div style="font-weight:700;">SwiftUI Calculator App</div>
        <div style="height:8px;"></div>
        <a href="https://github.com/MehmetBener/AP-CS-Principles-Projects/tree/main/SwiftUI_Calculator" target="_blank" rel="noopener noreferrer">Github Source Code</a>
        <div style="height:8px;"></div>

        <div style="font-weight:700;">Overview</div>
        <div style="height:8px;"></div>
        <div>This project is a simple SwiftUI-based calculator that takes two number inputs and performs four basic operations: addition, subtraction, multiplication, and division. It displays all results instantly.</div>
        <div style="height:8px;"></div>

        <div style="font-weight:700;">Key Idea</div>
        <div>The app converts the two input strings into Double values, performs calculations, and displays the results in real time inside styled text fields and labels.</div>
        <div style="height:8px;"></div>

        <div style="font-weight:700;">How It Works</div>
        <div>The app uses <code>@State</code> properties to store the two user inputs.</div>
        <div>The strings are converted into double type variables.</div>
        <div>It calculates addition, subtraction, multiplication, and division results immediately.</div>
        <div>A ZStack and VStack are used to organize the UI with a clean look.</div>
        <div>Division by zero is safely handled by displaying “—” instead of an error.</div>
        <div style="height:8px;"></div>

        <div style="font-weight:700;">Issues I Faced</div>
        <div>I had trouble with a "Partial Double" type when i tried to perform calculations on my variables already converted to Double's.</div>
        <div>I researched the issue and found a solution where "?? 0" is used while converting the String type to a Double.</div>
        <div style="height:8px;"></div>

        <div style="font-weight:700;">Limitations Right Now</div>
        <div>No dedicated "Calculate" button; results update instantly but lack manual control.</div>
        <div>No ability to perform chained operations or store previous results.</div>
        <div>No history or memory functionality.</div>
        <div style="height:8px;"></div>

        <div style="font-weight:700;">Next Steps</div>
        <div>Add a "Calculate" button for better control.</div>
        <div>Improve input validation to prevent invalid entries.</div>
        <div>Add a clear/reset button to reset fields.</div>
        </div>  
    </div>      
  </main>

  <footer>
    <div class="links" aria-label="Profile Links">
      <a href="https://www.linkedin.com/in/mehmet-bener-972624324/" target="_blank" rel="noopener noreferrer">LinkedIn</a>
      <a href="https://orcid.org/0009-0000-8578-6070" target="_blank" rel="noopener noreferrer">ORCID</a>
      <a href="https://github.com/MehmetBener" target="_blank" rel="noopener noreferrer">GitHub</a>
      <a href="https://scratch.mit.edu/users/mehmetbener/" target="_blank" rel="noopener noreferrer">Scratch</a>
    </div>
  </footer>

  <script>
    const pages = Array.from(document.querySelectorAll('.page'));
    const navLinks = {
      home: document.getElementById('nav-home'),
      projects: document.getElementById('nav-projects'),
      'big-ideas': document.getElementById('nav-big-ideas'),
      documentation: document.getElementById('nav-documentation')
    };

    function showPage(name) {
      pages.forEach(sec => sec.style.display = 'none');
      Object.values(navLinks).forEach(a => a.removeAttribute('aria-current'));

      const id = name || 'home';
      const active = document.getElementById(id);
      if (active) {
        active.style.display = 'block';
        if (navLinks[id]) navLinks[id].setAttribute('aria-current', 'page');
        const newTitle = active.getAttribute('data-title') || 'Mehmet Bener — Portfolio';
        document.title = newTitle;
      } else {
        location.hash = '#home';
      }
    }

    function onRouteChange() {
      const hash = location.hash.replace('#', '');
      showPage(hash || 'home');
    }

    window.addEventListener('hashchange', onRouteChange);
    window.addEventListener('DOMContentLoaded', onRouteChange);
  </script>
</body>
</html>
