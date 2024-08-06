# PowerPoint Image Scraper

This project provides a PowerShell script to extract images from a PowerPoint (.pptx) file. It leverages two main functions: one to unzip the PowerPoint file into its raw XML components (which includes a media folder), and another to extract the images from the media folder into a dedicated directory at the root of the project.

## Usage

1. **Clone the repository:**

  ```sh
  git clone https://https://github.com/cadensstudio/pptx-image-scraper.git
  cd pptx-image-scraper
  ```

2. **Create a `.env` file:**

  Copy the `.env.example` file to `.env` and set the `FILEPATH` variable to the path of your PowerPoint file.

  ```sh
  cp .env.example .env
  ```

  Update the `FILEPATH` variable in the `.env` file:

  ```
  FILEPATH=/path/to/your/powerpoint.pptx
  ```

3. **Run the script:**

  Open a PowerShell terminal and execute the `extract.ps1` script:

  ```powershell
  .\extract.ps1
  ```

4. **Check the `media` folder for images:**

  After running the script, the images will be available in the `media` directory wherever the script was run from.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.