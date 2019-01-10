command! -bang -nargs=* LMModule
            \ call fzf#run(fzf#wrap('lmmodule', {'source':'find .  -type d  \( ! -iname ".*" \) -maxdepth 3 | grep "app/Modules/" | grep -i "' . (<q-args>) . '" | sed "s|^\./||g"', 'sink': 'NERDTreeFind'}, <bang>0))

command! -bang -nargs=* LMRouter
            \ call fzf#run(fzf#wrap('lrrouter', {'source':'find .  -type f \( ! -iname ".*" \) | grep "app/Modules/" | grep "Routes" | grep -i "' . (<q-args>) . '" | sed "s|^\./||g"', 'sink': 'e'}, <bang>0))

command! -bang -nargs=* LMConfig
            \ call fzf#run(fzf#wrap('lmconfig', {'source':'find .  -type f \( ! -iname ".*" \) | grep "app/Modules/" | grep "config" | grep -i "' . (<q-args>) . '" | sed "s|^\./||g"', 'sink': 'e'}, 0))

command! -bang -nargs=* LMController
            \ call fzf#run(fzf#wrap('lmcontroller', {'source':'find .  -type f \( ! -iname ".*" \) | grep "app/Modules/" | grep "Http/Controllers" | grep -i "' . (<q-args>) . '" | sed "s|^\./||g"', 'sink': 'e'}, 0))
command! -bang -nargs=* LMView
            \ call fzf#run(fzf#wrap('lmview', {'source':'find .  -type f \( ! -iname ".*" \) | grep "app/Modules/" | grep "Resources/Views" | grep -i "' . (<q-args>) . '" | sed "s|^\./||g"', 'sink': 'e'}, 0))

command! -bang -nargs=* LConfig
            \ call fzf#run(fzf#wrap('LConfig', {'source':'find .  -type f \( ! -iname ".*" \) | grep -v "app/Modules/" | grep "config" | grep -i "' . (<q-args>) . '" | sed "s|^\./||g"', 'sink': 'e'}, 0))

command! -bang -nargs=* LModel
            \ call fzf#run(fzf#wrap('LModel', {'source':'find .  -type f \( ! -iname ".*" \) | grep -v "app/Modules/" | grep "app/Models" | grep -i "' . (<q-args>) . '" | sed "s|^\./||g"', 'sink': 'e'}, 0))

command! -bang -nargs=* LEvent
            \ call fzf#run(fzf#wrap('LEvent', {'source':'find .  -type f \( ! -iname ".*" \) | grep -v "app/Modules/" | grep "app/Events/" | grep -i "' . (<q-args>) . '" | sed "s|^\./||g"', 'sink': 'e'}, 0))

command! -bang -nargs=* LListener
            \ call fzf#run(fzf#wrap('LListener', {'source':'find .  -type f \( ! -iname ".*" \) | grep -v "app/Modules/" | grep "app/Listeners/" | grep -i "' . (<q-args>) . '" | sed "s|^\./||g"', 'sink': 'e'}, 0))

command! -bang -nargs=* LResource
            \ call fzf#run(fzf#wrap('LResource', {'source':'find .  -type f \( ! -iname ".*" \) | grep -v "app/Modules/" | grep "app/Http/Resources" | grep -i "' . (<q-args>) . '" | sed "s|^\./||g"', 'sink': 'e'}, 0))