import 'route_models.dart';

const String demoRouteDataNotice =
    'SIMULATED LOCAL DEMO DATA\nNON-PERSISTENT\nNOT FROM A BACKEND\nGENERIC PLACEHOLDER EXERCISES ARE NOT CANONICAL PEDAGOGICAL CONTENT.';

List<LearningLevel> get demoRouteLevels => const [
  LearningLevel(
    id: 'basico',
    title: 'Básico',
    status: RouteStatus.completed,
    lessons: [
      Lesson(
        id: 'basico-1',
        title: 'Lección 1',
        status: RouteStatus.completed,
        exercises: [
          Exercise(
            id: 'basico-1-e1',
            title: 'Ejercicio 1',
            status: RouteStatus.completed,
          ),
          Exercise(
            id: 'basico-1-e2',
            title: 'Ejercicio 2',
            status: RouteStatus.completed,
          ),
        ],
      ),
    ],
  ),
  LearningLevel(
    id: 'elemental',
    title: 'Elemental',
    status: RouteStatus.completed,
    lessons: [
      Lesson(
        id: 'elemental-1',
        title: 'Lección 1',
        status: RouteStatus.completed,
        exercises: [
          Exercise(
            id: 'elemental-1-e1',
            title: 'Ejercicio 1',
            status: RouteStatus.completed,
          ),
          Exercise(
            id: 'elemental-1-e2',
            title: 'Ejercicio 2',
            status: RouteStatus.completed,
          ),
        ],
      ),
    ],
  ),
  LearningLevel(
    id: 'intermedio',
    title: 'Intermedio',
    status: RouteStatus.active,
    lessons: [
      Lesson(
        id: 'cadencias-funcionales',
        title: 'Cadencias funcionales',
        status: RouteStatus.completed,
        exercises: [
          Exercise(
            id: 'cf-e1',
            title: 'Ejercicio 1',
            status: RouteStatus.completed,
          ),
          Exercise(
            id: 'cf-e2',
            title: 'Ejercicio 2',
            status: RouteStatus.completed,
          ),
          Exercise(
            id: 'cf-e3',
            title: 'Ejercicio 3',
            status: RouteStatus.completed,
          ),
          Exercise(
            id: 'cf-e4',
            title: 'Ejercicio 4',
            status: RouteStatus.completed,
          ),
        ],
      ),
      Lesson(
        id: 'acordes-con-septima',
        title: 'Acordes con séptima',
        status: RouteStatus.active,
        exercises: [
          Exercise(
            id: 'as-e1',
            title: 'Identificar acordes con séptima',
            status: RouteStatus.completed,
          ),
          Exercise(
            id: 'as-e2',
            title: 'Construir progresión ii-V-I',
            status: RouteStatus.active,
          ),
          Exercise(
            id: 'as-e3',
            title: 'Ejecutar cadencia en guitarra',
            status: RouteStatus.locked,
          ),
          Exercise(
            id: 'as-e4',
            title: 'Evaluación interactiva',
            status: RouteStatus.locked,
          ),
        ],
      ),
      Lesson(
        id: 'progresiones-armonicas',
        title: 'Progresiones armónicas',
        status: RouteStatus.locked,
        exercises: [
          Exercise(
            id: 'pa-e1',
            title: 'Ejercicio 1',
            status: RouteStatus.locked,
          ),
          Exercise(
            id: 'pa-e2',
            title: 'Ejercicio 2',
            status: RouteStatus.locked,
          ),
          Exercise(
            id: 'pa-e3',
            title: 'Ejercicio 3',
            status: RouteStatus.locked,
          ),
          Exercise(
            id: 'pa-e4',
            title: 'Ejercicio 4',
            status: RouteStatus.locked,
          ),
        ],
      ),
    ],
  ),
  LearningLevel(
    id: 'avanzado',
    title: 'Avanzado',
    status: RouteStatus.locked,
    lessons: [
      Lesson(
        id: 'avanzado-1',
        title: 'Lección 1',
        status: RouteStatus.locked,
        exercises: [
          Exercise(
            id: 'avanzado-1-e1',
            title: 'Ejercicio 1',
            status: RouteStatus.locked,
          ),
          Exercise(
            id: 'avanzado-1-e2',
            title: 'Ejercicio 2',
            status: RouteStatus.locked,
          ),
        ],
      ),
    ],
  ),
  LearningLevel(
    id: 'experto',
    title: 'Experto',
    status: RouteStatus.locked,
    lessons: [
      Lesson(
        id: 'experto-1',
        title: 'Lección 1',
        status: RouteStatus.locked,
        exercises: [
          Exercise(
            id: 'experto-1-e1',
            title: 'Ejercicio 1',
            status: RouteStatus.locked,
          ),
          Exercise(
            id: 'experto-1-e2',
            title: 'Ejercicio 2',
            status: RouteStatus.locked,
          ),
        ],
      ),
    ],
  ),
];
