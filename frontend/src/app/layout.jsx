import './globals.css'
import { config } from '@fortawesome/fontawesome-svg-core'
import { faFootball } from '@fortawesome/free-solid-svg-icons'
import '@fortawesome/fontawesome-svg-core/styles.css'

config.autoAddCss = false

export const metadata = {
  title: 'Best Play Option',
  description: 'Football play analysis application',
  icons: [
    { rel: 'icon', url: '/page-icon.svg', type: 'image/svg+xml' },
    { rel: 'icon', url: '/page-icon.svg' }
  ]
}

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>
        <div className="app-container">
          {children}
        </div>
      </body>
    </html>
  )
}
