import 'dart:convert';
import '../models/roadmap.dart';

class ClaudeService {
  Future<Roadmap> generateRoadmap(String goal) async {
    await Future.delayed(const Duration(seconds: 3));
    
    // Hedefi analiz et
    final goalLower = goal.toLowerCase();
    
    // Dinamik mock data - hedefe göre farklı roadmap
    if (goalLower.contains('frontend') || goalLower.contains('web')) {
      return _getFrontendRoadmap(goal);
    } else if (goalLower.contains('backend') || goalLower.contains('server')) {
      return _getBackendRoadmap(goal);
    } else if (goalLower.contains('prompt') || goalLower.contains('ai')) {
      return _getPromptEngineerRoadmap(goal);
    } else if (goalLower.contains('hemşire') || goalLower.contains('hemsire') || goalLower.contains('nurse')) {
      return _getNurseRoadmap(goal);
    } else if (goalLower.contains('buchhalter') || goalLower.contains('muhasebe')) {
      return _getBuchhalterRoadmap(goal);
    } else if (goalLower.contains('almanca') || goalLower.contains('deutsch') || goalLower.contains('dtz')) {
      return _getGermanRoadmap(goal);
    } else {
      return _getGenericRoadmap(goal);
    }
  }
  
  Roadmap _getPromptEngineerRoadmap(String goal) {
    return Roadmap.fromJson({
      "title": "Prompt Engineer Yol Haritası",
      "description": "AI çağında en çok aranan becerilerden biri. GPT, Claude ve diğer LLM'lerle etkili çalışmayı öğren.",
      "totalWeeks": 16,
      "phases": [
        {
          "id": "phase-1",
          "title": "AI & LLM Temelleri",
          "description": "Yapay zeka ve dil modellerinin temellerini öğren",
          "weekStart": 1,
          "weekEnd": 6,
          "level": "beginner",
          "topics": [
            {
              "name": "AI ve LLM'e Giriş",
              "description": "GPT, Claude, ve diğer modellerin nasıl çalıştığını anla",
              "estimatedHours": 25,
              "resources": [
                {
                  "title": "OpenAI Documentation",
                  "url": "https://platform.openai.com/docs/introduction",
                  "type": "documentation",
                  "isFree": true
                },
                {
                  "title": "Anthropic Claude Docs",
                  "url": "https://docs.anthropic.com/",
                  "type": "documentation",
                  "isFree": true
                }
              ],
              "isCompleted": false
            },
            {
              "name": "Prompt Basics",
              "description": "Temel prompt yazma teknikleri",
              "estimatedHours": 30,
              "resources": [
                {
                  "title": "Learn Prompting",
                  "url": "https://learnprompting.org/",
                  "type": "course",
                  "isFree": true
                },
                {
                  "title": "Prompt Engineering Guide",
                  "url": "https://www.promptingguide.ai/",
                  "type": "documentation",
                  "isFree": true
                }
              ],
              "isCompleted": false
            }
          ],
          "milestones": [
            "10+ farklı prompt tekniğini dene",
            "Kendi prompt library'ni oluştur"
          ]
        },
        {
          "id": "phase-2",
          "title": "İleri Seviye Teknikler",
          "description": "Chain-of-thought, few-shot ve diğer advanced teknikler",
          "weekStart": 7,
          "weekEnd": 12,
          "level": "intermediate",
          "topics": [
            {
              "name": "Advanced Prompting",
              "description": "Chain-of-thought, few-shot learning, role prompting",
              "estimatedHours": 40,
              "resources": [
                {
                  "title": "OpenAI Cookbook",
                  "url": "https://cookbook.openai.com/",
                  "type": "documentation",
                  "isFree": true
                },
                {
                  "title": "Anthropic Prompt Library",
                  "url": "https://docs.anthropic.com/claude/prompt-library",
                  "type": "documentation",
                  "isFree": true
                }
              ],
              "isCompleted": false
            },
            {
              "name": "API Integration",
              "description": "AI modellerini programatik olarak kullan",
              "estimatedHours": 35,
              "resources": [
                {
                  "title": "OpenAI API Quickstart",
                  "url": "https://platform.openai.com/docs/quickstart",
                  "type": "documentation",
                  "isFree": true
                }
              ],
              "isCompleted": false
            }
          ],
          "milestones": [
            "AI-powered uygulama geliştir",
            "Prompt optimization case study'leri yap"
          ]
        },
        {
          "id": "phase-3",
          "title": "Profesyonel Uygulama",
          "description": "Gerçek projelerde prompt engineering",
          "weekStart": 13,
          "weekEnd": 16,
          "level": "advanced",
          "topics": [
            {
              "name": "Production-Ready Prompts",
              "description": "Güvenlik, maliyet ve performans optimizasyonu",
              "estimatedHours": 30,
              "resources": [
                {
                  "title": "Best Practices - Anthropic",
                  "url": "https://docs.anthropic.com/claude/docs/best-practices",
                  "type": "documentation",
                  "isFree": true
                }
              ],
              "isCompleted": false
            }
          ],
          "milestones": [
            "Portfolio projelerini tamamla",
            "Freelance/iş başvuruları yap"
          ]
        }
      ]
    });
  }
  
  Roadmap _getNurseRoadmap(String goal) {
    return Roadmap.fromJson({
      "title": "Almanya'da Hemşire Olma Yol Haritası",
      "description": "Almanya'da hemşire olarak çalışmak için gereken tüm adımlar ve süreçler.",
      "totalWeeks": 52,
      "phases": [
        {
          "id": "phase-1",
          "title": "Dil Öğrenimi",
          "description": "Almanca B2 seviyesine ulaş (zorunlu)",
          "weekStart": 1,
          "weekEnd": 24,
          "level": "beginner",
          "topics": [
            {
              "name": "Almanca A1-A2",
              "description": "Temel Almanca seviyesi",
              "estimatedHours": 200,
              "resources": [
                {
                  "title": "Goethe Institut Kursları",
                  "url": "https://www.goethe.de/",
                  "type": "course",
                  "isFree": false
                },
                {
                  "title": "DW Almanca Öğren",
                  "url": "https://learngerman.dw.com/",
                  "type": "course",
                  "isFree": true
                }
              ],
              "isCompleted": false
            },
            {
              "name": "Almanca B1-B2",
              "description": "Medikal Almanca dahil",
              "estimatedHours": 300,
              "resources": [
                {
                  "title": "Telc B2 Hazırlık",
                  "url": "https://www.telc.net/",
                  "type": "course",
                  "isFree": false
                }
              ],
              "isCompleted": false
            }
          ],
          "milestones": [
            "A2 sertifikası al",
            "B2 Telc/Goethe sınavını geç"
          ]
        },
        {
          "id": "phase-2",
          "title": "Diploma Denkliği",
          "description": "Hemşirelik diplomasını Almanya'da tanıt",
          "weekStart": 25,
          "weekEnd": 36,
          "level": "intermediate",
          "topics": [
            {
              "name": "Belge Hazırlığı",
              "description": "Diploma, transcript ve diğer belgeler",
              "estimatedHours": 40,
              "resources": [
                {
                  "title": "Anerkennung in Deutschland",
                  "url": "https://www.anerkennung-in-deutschland.de/",
                  "type": "documentation",
                  "isFree": true
                }
              ],
              "isCompleted": false
            },
            {
              "name": "Anpassungslehrgang (Uyum Kursu)",
              "description": "Eksik eğitimleri tamamla",
              "estimatedHours": 400,
              "resources": [
                {
                  "title": "Bundesagentur für Arbeit",
                  "url": "https://www.arbeitsagentur.de/",
                  "type": "documentation",
                  "isFree": true
                }
              ],
              "isCompleted": false
            }
          ],
          "milestones": [
            "Denklik başvurusunu yap",
            "Anpassungslehrgang'ı tamamla"
          ]
        },
        {
          "id": "phase-3",
          "title": "İş Bulma & Çalışma",
          "description": "Almanya'da hemşire olarak çalışmaya başla",
          "weekStart": 37,
          "weekEnd": 52,
          "level": "advanced",
          "topics": [
            {
              "name": "İş Başvuruları",
              "description": "CV, Bewerbung ve mülakat hazırlığı",
              "estimatedHours": 50,
              "resources": [
                {
                  "title": "Make it in Germany",
                  "url": "https://www.make-it-in-germany.com/",
                  "type": "documentation",
                  "isFree": true
                }
              ],
              "isCompleted": false
            }
          ],
          "milestones": [
            "En az 10 hastaneye başvuru yap",
            "İlk iş teklifini al",
            "Almanya'da hemşire olarak çalışmaya başla"
          ]
        }
      ]
    });
  }
  
  Roadmap _getBuchhalterRoadmap(String goal) {
    return Roadmap.fromJson({
      "title": "Almanya'da Buchhalter (Muhasebeci) Yol Haritası",
      "description": "Almanya'da muhasebeci olarak kariyer yapmak için adım adım plan.",
      "totalWeeks": 48,
      "phases": [
        {
          "id": "phase-1",
          "title": "Almanca & Temel Bilgiler",
          "description": "Dil ve temel muhasebe bilgisi",
          "weekStart": 1,
          "weekEnd": 20,
          "level": "beginner",
          "topics": [
            {
              "name": "Almanca B2-C1",
              "description": "İş Almancası ve muhasebe terimleri",
              "estimatedHours": 300,
              "resources": [
                {
                  "title": "Fachsprache Rechnungswesen",
                  "url": "https://www.goethe.de/",
                  "type": "course",
                  "isFree": false
                }
              ],
              "isCompleted": false
            },
            {
              "name": "Alman Muhasebe Sistemi (HGB)",
              "description": "Handelsgesetzbuch - Ticaret Kanunu",
              "estimatedHours": 100,
              "resources": [
                {
                  "title": "IHK Buchführung Kursu",
                  "url": "https://www.ihk.de/",
                  "type": "course",
                  "isFree": false
                }
              ],
              "isCompleted": false
            }
          ],
          "milestones": [
            "Almanca C1 sertifikası",
            "Temel muhasebe kursunu tamamla"
          ]
        },
        {
          "id": "phase-2",
          "title": "Sertifikasyon",
          "description": "Bilanzbuchhalter veya Steuerfachangestellte",
          "weekStart": 21,
          "weekEnd": 40,
          "level": "intermediate",
          "topics": [
            {
              "name": "Ausbildung / Weiterbildung",
              "description": "Mesleki eğitim programı",
              "estimatedHours": 800,
              "resources": [
                {
                  "title": "IHK Bilanzbuchhalter",
                  "url": "https://www.ihk.de/",
                  "type": "course",
                  "isFree": false
                }
              ],
              "isCompleted": false
            }
          ],
          "milestones": [
            "IHK sınavını geç",
            "Sertifika al"
          ]
        },
        {
          "id": "phase-3",
          "title": "Kariyer",
          "description": "İş bulma ve kariyer geliştirme",
          "weekStart": 41,
          "weekEnd": 48,
          "level": "advanced",
          "topics": [
            {
              "name": "İş Arama",
              "description": "Bewerbung ve networking",
              "estimatedHours": 60,
              "resources": [
                {
                  "title": "StepStone Karriere",
                  "url": "https://www.stepstone.de/",
                  "type": "documentation",
                  "isFree": true
                }
              ],
              "isCompleted": false
            }
          ],
          "milestones": [
            "Muhasebe firmasında çalışmaya başla"
          ]
        }
      ]
    });
  }
  
  Roadmap _getGermanRoadmap(String goal) {
    return Roadmap.fromJson({
      "title": "Almanca B1 → DTZ Yol Haritası",
      "description": "DTZ sınavına hazırlık ve B1 sertifikası alma",
      "totalWeeks": 20,
      "phases": [
        {
          "id": "phase-1",
          "title": "B1 Seviyesi",
          "description": "Almanca B1 dilbilgisi ve kelime",
          "weekStart": 1,
          "weekEnd": 16,
          "level": "beginner",
          "topics": [
            {
              "name": "B1 Grammatik",
              "description": "Dilbilgisi kuralları",
              "estimatedHours": 120,
              "resources": [
                {
                  "title": "DW B1 Kursu",
                  "url": "https://learngerman.dw.com/",
                  "type": "course",
                  "isFree": true
                }
              ],
              "isCompleted": false
            }
          ],
          "milestones": [
            "Günlük konuşma pratiği yap"
          ]
        }
      ]
    });
  }
  
  Roadmap _getFrontendRoadmap(String goal) {
    // Önceki frontend mock data...
    return Roadmap.fromJson({
      "title": "Frontend Developer Yol Haritası",
      "description": "Modern web development ile profesyonel frontend developer ol",
      "totalWeeks": 24,
      "phases": [] // Önceki kod...
    });
  }
  
  Roadmap _getBackendRoadmap(String goal) {
    return Roadmap.fromJson({
      "title": "Backend Developer Yol Haritası",
      "description": "Server-side development ile profesyonel backend developer ol",
      "totalWeeks": 26,
      "phases": []
    });
  }
  
  Roadmap _getGenericRoadmap(String goal) {
    return Roadmap.fromJson({
      "title": "$goal - Öğrenme Yol Haritası",
      "description": "Hedefinize ulaşmak için özel olarak hazırlanmış yol haritası",
      "totalWeeks": 20,
      "phases": [
        {
          "id": "phase-1",
          "title": "Başlangıç",
          "description": "Temel bilgileri öğren",
          "weekStart": 1,
          "weekEnd": 8,
          "level": "beginner",
          "topics": [
            {
              "name": "Temeller",
              "description": "Alan hakkında temel bilgi edin",
              "estimatedHours": 50,
              "resources": [
                {
                  "title": "YouTube Tutorials",
                  "url": "https://youtube.com/",
                  "type": "video",
                  "isFree": true
                }
              ],
              "isCompleted": false
            }
          ],
          "milestones": ["İlk projeyi tamamla"]
        }
      ]
    });
  }
}