// ===== Estado =====
let tarefas = JSON.parse(localStorage.getItem('studyflow.tarefas')) || [];
let filtroAtual = 'all';

// ===== Tema =====
const themeToggle = document.getElementById('themeToggle');
const temaSalvo = localStorage.getItem('studyflow.tema') || 'light';
document.documentElement.setAttribute('data-theme', temaSalvo);

themeToggle.addEventListener('click', () => {
    const atual = document.documentElement.getAttribute('data-theme');
    const novo = atual === 'dark' ? 'light' : 'dark';
    document.documentElement.setAttribute('data-theme', novo);
    localStorage.setItem('studyflow.tema', novo);
});

// ===== Elementos =====
const taskInput = document.getElementById('taskInput');
const dateInput = document.getElementById('dateInput');
const priorityInput = document.getElementById('priorityInput');
const addBtn = document.getElementById('addBtn');
const taskList = document.getElementById('taskList');
const statTotal = document.getElementById('statTotal');
const statPending = document.getElementById('statPending');
const statDone = document.getElementById('statDone');
const filterBtns = document.querySelectorAll('.filter-btn');

// ===== Persistência =====
function salvar() {
    localStorage.setItem('studyflow.tarefas', JSON.stringify(tarefas));
}

// ===== Utilidades =====
function formatarData(data) {
    if (!data) return 'Sem data';
    const [ano, mes, dia] = data.split('-');
    return `${dia}/${mes}/${ano}`;
}

function criarSvgIcon(path) {
    return `<svg viewBox="0 0 24 24" fill="none">${path}</svg>`;
}

const ICON_CALENDAR = criarSvgIcon(
    '<rect x="3" y="5" width="18" height="16" rx="2" stroke="currentColor" stroke-width="1.8"/>' +
    '<path d="M3 9h18M8 3v4M16 3v4" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/>'
);

const ICON_TRASH = criarSvgIcon(
    '<path d="M4 7h16M9 7V5a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v2M6 7l1 12a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2l1-12" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/>'
);

// ===== Ações =====
function adicionarTarefa() {
    const texto = taskInput.value.trim();
    if (!texto) {
        taskInput.focus();
        taskInput.style.borderColor = 'var(--danger)';
        setTimeout(() => taskInput.style.borderColor = '', 800);
        return;
    }

    tarefas.push({
        id: Date.now(),
        texto,
        data: dateInput.value,
        prioridade: priorityInput.value,
        concluida: false
    });

    salvar();
    renderizar();

    taskInput.value = '';
    dateInput.value = '';
    priorityInput.value = 'media';
    taskInput.focus();
}

function alternarConclusao(id) {
    const t = tarefas.find(t => t.id === id);
    if (t) {
        t.concluida = !t.concluida;
        salvar();
        renderizar();
    }
}

function removerTarefa(id, el) {
    el.style.transform = 'translateX(-30px)';
    el.style.opacity = '0';
    setTimeout(() => {
        tarefas = tarefas.filter(t => t.id !== id);
        salvar();
        renderizar();
    }, 220);
}

// ===== Estatísticas =====
function atualizarContadores() {
    const total = tarefas.length;
    const concluidas = tarefas.filter(t => t.concluida).length;
    animarNumero(statTotal, total);
    animarNumero(statPending, total - concluidas);
    animarNumero(statDone, concluidas);
}

function animarNumero(el, valorFinal) {
    const valorAtual = parseInt(el.textContent) || 0;
    if (valorAtual === valorFinal) return;

    const passos = 15;
    const incremento = (valorFinal - valorAtual) / passos;
    let i = 0;

    const timer = setInterval(() => {
        i++;
        el.textContent = Math.round(valorAtual + incremento * i);
        if (i >= passos) {
            el.textContent = valorFinal;
            clearInterval(timer);
        }
    }, 20);
}

// ===== Renderização =====
function renderizar() {
    taskList.innerHTML = '';

    let lista = tarefas;
    if (filtroAtual === 'pendente') lista = tarefas.filter(t => !t.concluida);
    if (filtroAtual === 'concluida') lista = tarefas.filter(t => t.concluida);

    if (lista.length === 0) {
        const li = document.createElement('li');
        li.className = 'empty-message';
        li.textContent = tarefas.length === 0
            ? 'Nenhuma atividade cadastrada. Comece adicionando uma!'
            : 'Nenhuma tarefa neste filtro.';
        taskList.appendChild(li);
        atualizarContadores();
        return;
    }

    const ordem = { alta: 1, media: 2, baixa: 3 };

    lista
        .slice()
        .sort((a, b) => {
            if (a.concluida !== b.concluida) return a.concluida ? 1 : -1;
            return ordem[a.prioridade] - ordem[b.prioridade];
        })
        .forEach((tarefa, index) => {
            const li = document.createElement('li');
            li.className = `task-item prioridade-${tarefa.prioridade}`;
            li.style.animationDelay = `${index * 40}ms`;
            if (tarefa.concluida) li.classList.add('concluida');

            li.innerHTML = `
                <input type="checkbox" class="task-checkbox" ${tarefa.concluida ? 'checked' : ''}>
                <div class="task-info">
                    <span class="task-text"></span>
                    <span class="task-date">${ICON_CALENDAR} ${formatarData(tarefa.data)}</span>
                </div>
                <button class="delete-btn" aria-label="Remover">${ICON_TRASH}</button>
            `;

            // Segurança contra XSS
            li.querySelector('.task-text').textContent = tarefa.texto;

            li.querySelector('.task-checkbox')
                .addEventListener('change', () => alternarConclusao(tarefa.id));

            li.querySelector('.delete-btn')
                .addEventListener('click', () => removerTarefa(tarefa.id, li));

            taskList.appendChild(li);
        });

    atualizarContadores();
}

// ===== Eventos =====
addBtn.addEventListener('click', adicionarTarefa);

taskInput.addEventListener('keypress', e => {
    if (e.key === 'Enter') adicionarTarefa();
});

filterBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        filterBtns.forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        filtroAtual = btn.dataset.filter;
        renderizar();
    });
});

// ===== Init =====
renderizar();