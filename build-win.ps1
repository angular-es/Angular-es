$NG_intro = @"
                             ,,                             
                      ,,,,,,,,,,,,,,,,                      
               ,,,,,,,,,,,,,,,*,,,,,,,,,,,,,,               
        ,,,,,,,,,,,,,,,,,,,,,@@@,,,,,,,,,,,,,,,,,,,,,       
        ,,,,,,,,,,,,,,,,,,,,@@@@@,,,,,,,,,,,,,,,,,,,,       
         ,,,,,,,,,,,,,,,,,,@@@@@@@,,,,,,,,,,,,,,,,,,        
         ,,,,,,,,,,,,,,,,,@@@@@@@@@,,,,,,,,,,,,,,,,,        
         ,,,,,,,,,,,,,,,,@@@@#,@@@@@,,,,,,,,,,,,,,,,        
          ,,,,,,,,,,,,,,@@@@,,,,%@@@@,,,,,,,,,,,,,,         
          ,,,,,,,,,,,,,@@@@,,,,,,,@@@@,,,,,,,,,,,,,         
          ,,,,,,,,,,,,@@@@@@@@@@@@@@@@@,,,,,,,,,,,,         
          ,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@*,,,,,,,,,,         
           ,,,,,,,,@@@@@,,,,,,,,,,,,,@@@@@,,,,,,,,          
           ,,,,,,,@@@@@,,,,,,,,,,,,,,,@@@@@,,,,,,,          
           ,,,,,,@@@@@,,,,,,,,,,,,,,,,,@@@@@,,,,,,          
            ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,           
                 ,,,,,,,,,,,,,,,,,,,,,,,,,,,                
                     ,,,,,,,,,,,,,,,,,,,                    
                          ,,,,,,,,,                         
                              ,                                                                                         
                             _              _    _ _                             
     /\                     | |            | |  | (_)                            
    /  \   _ __   __ _ _   _| | __ _ _ __  | |__| |_ ___ _ __   __ _ _ __   ___  
   / /\ \ | '_ \ / _`  | | | | |/ _`  | '__| |  __  | / __| '_ \ / _`  | '_ \ / _ \ 
  / ____ \| | | | (_| | |_| | | (_| | |    | |  | | \__ \ |_) | (_| | | | | (_) |
 /_/    \_\_| |_|\__, |\__,_|_|\__,_|_|    |_|  |_|_|___/ .__/ \__,_|_| |_|\___/ 
                  __/ |                                 | |                      
                 |___/                                  |_|                      

"@

Write-Host $NG_intro
# copy origin to temporary workspace
Set-Location origin
git clean -xdn
Set-Location ..
robocopy origin .tmp /e

# overrides files from ja directory
robocopy aio-es/ .tmp/aio /e

# build angular.io
Set-Location .tmp
yarn install --frozen-lockfile --non-interactive
Set-Location aio
yarn build

Set-Location ../../

# Copy robots.txt
robocopy aio-es/src/robots.txt .tmp/aio/dist/ /is

# Modify sitemap
((Get-Content -path .tmp/aio/dist/generated/sitemap.xml -Raw) -replace 'angular.io','angular-es.dev') | Set-Content -Path .tmp/aio/dist/generated/sitemap.xml
msbuild
